
# neuralnet.py
# ---------------
# Licensing Information:  You are free to use or extend this projects for
# educational purposes provided that (1) you do not distribute or publish
# solutions, (2) you retain this notice, and (3) you provide clear
# attribution to the University of Illinois at Urbana-Champaign
#
# Created by Justin Lizama (jlizama2@illinois.edu) on 10/29/2019
import numpy as np
import torch
import random


class NeuralNet(torch.nn.Module):
    def __init__(self, lrate,loss_fn,in_size,out_size):

        super(NeuralNet, self).__init__()
        torch.manual_seed(0)
        self.loss_fn = loss_fn
        self.in_size = in_size
        self.out_size = out_size
        self.lrate = lrate
        #
        self.conv1 = torch.nn.Conv2d(3, 8, 3, padding=1)
        self.pool = torch.nn.MaxPool2d(2, 2)
        self.conv2 = torch.nn.Conv2d(8, 8, 2, padding=1)
        self.conv3 = torch.nn.Conv2d(8, 3, 2, padding=1)
        self.fc1 = torch.nn.Linear(3*4*4, out_size)

        self.optimizer = torch.optim.Adam(self.parameters(), lr=self.lrate)


    def forward(self, x):
        """ A forward pass of your neural net (evaluates f(x)).

        @param x: an (N, in_size) torch tensor

        @return y: an (N, out_size) torch tensor of output from the network
        """

        num = 0
        if len(x.size()) > 1:
            num = x.size()[0]
        else:
            num = 1
        x = x.reshape(num, 3, 128, 128)
        conv1_res = self.conv1(x)
        conv1_res = self.pool(conv1_res)

        conv2_res = self.conv2(conv1_res)
        conv2_res = self.pool(conv2_res)

        conv2_res = self.conv2(conv2_res)
        conv2_res = self.pool(conv2_res)

        conv3_res = self.conv2(conv2_res)
        conv3_res = self.pool(conv2_res)

        conv4_res = self.conv3(conv3_res)
        conv4_res = self.pool(conv4_res)

        conv4_res = conv4_res.reshape(num, 3*4*4)
        res = self.fc1(conv4_res)

        return res


    def step(self, x, y):
        """
        Performs one gradient step through a batch of data x with labels y
        @param x: an (N, in_size) torch tensor
        @param y: an (N,) torch tensor
        @return L: total empirical risk (mean of losses) at this time step as a float
        """

        self.optimizer.zero_grad()


        outputs = self.forward(x)
        loss = self.loss_fn(outputs, y)

        loss.backward()
        self.optimizer.step()

        return loss.item()



def fit(train_set,train_labels,rec_set, rec_names):
    """ Make NeuralNet object 'net' and use net.step() to train a neural net
    and net(x) to evaluate the neural net.

    @param train_set: an (N, in_size) torch tensor
    @param train_labels: an (N,) torch tensor
    @param dev_set: an (M,) torch tensor
    @param n_iter: int, the number of epochs of training
    @param batch_size: The size of each batch to train on. (default 100)

    # return all of these:

    @return losses: Array of total loss at the beginning and after each iteration. Ensure len(losses) == n_iter
    @return yhats: an (M,) NumPy array of binary labels for dev_set
    @return net: A NeuralNet object

    # NOTE: This must work for arbitrary M and N
    """

    train_size, in_size= train_set.size()
    batch_size = 20
    epochs = 5

    criterion = torch.nn.CrossEntropyLoss()
    net = NeuralNet(lrate=0.0001, loss_fn=criterion, in_size=in_size, out_size=2)

    losses = []
    for epoch in range(epochs):
        print(epoch)
        idx = 0
        loss_sum = 0
        while(idx*batch_size < train_size):
            loss = net.step(train_set[idx*batch_size : (idx + 1)*batch_size], train_labels[idx*batch_size : (idx + 1)*batch_size])
            loss_sum += loss
            idx += 1
        losses.append(loss_sum)
        print(losses)

    torch.save(net, "model.net")
    import math
    rec_res = []
    for idx, image in enumerate(rec_set):
        ans = net.forward(image)
        firstnum = math.exp(ans[0][0].item())
        secondnum = math.exp(ans[0][1].item())
        total = firstnum + secondnum
        if secondnum >= firstnum:
            rec_res.append((math.inf, rec_names[idx]))
        else:
            rec_res.append((secondnum/total, rec_names[idx]))


    return sorted(rec_res, reverse=True)
