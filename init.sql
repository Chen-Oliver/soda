CREATE TABLE brands (
  brandName VARCHAR(30) NOT NULL,
  priceRange VARCHAR(3),
  PRIMARY KEY(brandName)
);

CREATE TABLE clothing (
  name VARCHAR(30) NOT NULL,
  type VARCHAR(20) NOT NULL,
  gender VARCHAR(10) NOT NULL,
  price REAL NOT NULL,
  websiteURL VARCHAR(256) NOT NULL,
  brandName VARCHAR(30) NOT NULL,
  PRIMARY KEY(websiteURL),
  FOREIGN KEY (brandName) REFERENCES brands(brandName) ON DELETE CASCADE
);

CREATE TABLE colors (
  websiteURL VARCHAR(256) NOT NULL,
  imageURL VARCHAR(256) NOT NULL,
  color VARCHAR(30),
  actual VARCHAR(30),
  FOREIGN KEY (websiteURL) REFERENCES clothing(websiteURL) ON DELETE CASCADE
);

CREATE TABLE seasons (
  websiteURL VARCHAR(256) NOT NULL,
  season VARCHAR(15),
  FOREIGN KEY (websiteURL) REFERENCES clothing(websiteURL) ON DELETE CASCADE
);

INSERT INTO brands (brandName, priceRange)
VALUES ('H&M', '$');

INSERT INTO brands (brandName, priceRange)
VALUES ('Banana Republic', '$$');

INSERT INTO brands (brandName, priceRange)
VALUES ('APC', '$$$');

INSERT INTO brands (brandName, priceRange)
VALUES ('JCrew', '$$');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Patterned Sweatshorts', 'Pants', 'Male', 17.99, 'https://www2.hm.com/en_us/productpage.0456032021.html');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Slim Fit Chinos', 'Pants', 'Male', 29.99, 'https://www2.hm.com/en_us/productpage.0815456001.html');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Slacks', 'Pants', 'Female', 29.99, 'https://www2.hm.com/en_us/productpage.0777504001.html');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Hooded Sports Jacket', 'Sweater', 'Male', 49.99, 'https://www2.hm.com/en_us/productpage.0543548001.html');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Hooded Sweatshirt', 'Sweater', 'Male', 24.99, 'https://www2.hm.com/en_us/productpage.0685814005.html');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Printed Hooded Sweatshirt', 'Sweater', 'Male', 34.99, 'https://www2.hm.com/en_us/productpage.0782880002.html');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Fine-knit Turtleneck Sweater', 'Sweater', 'Male', 29.99, 'https://www2.hm.com/en_us/productpage.0793018002.html');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Mom High Ankle Jeans', 'Pants', 'Female', 49.99, 'https://www2.hm.com/en_us/productpage.0795334001.html');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Wool-blend Coat', 'Coat', 'Male', 99, 'https://www2.hm.com/en_us/productpage.0788172001.html');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Chelsea Boots', 'Shoes', 'Male', 59.99, 'https://www2.hm.com/en_us/productpage.0663382003.html');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Cotton Twill Trenchcoat', 'Coat', 'Male', 129, 'https://www2.hm.com/en_us/productpage.0755629001.html');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Cotton Canvas Sneakers', 'Shoes', 'Male', 29.99, 'https://www2.hm.com/en_us/productpage.0766112001.html');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Wool-blend Coat', 'Coat', 'Male', 99, 'https://www2.hm.com/en_us/productpage.0788301003.html');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Hooded Jacket', 'Jacket', 'Male', 59.99, 'https://www2.hm.com/en_us/productpage.0762169005.html');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Warm-lined Boots', 'Shoes', 'Female', 49.99, 'https://www2.hm.com/en_us/productpage.0797618001.html');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Biker Jacket', 'Jacket', 'Male', 59.99, 'https://www2.hm.com/en_us/productpage.0634744009.html');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Padded Lightweight Jacket', 'Jacket', 'Male', 34.99, 'https://www2.hm.com/en_us/productpage.0753481003.html');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('T-shirt with Printed Design', 'Shirt', 'Male', 17.99, 'https://www2.hm.com/en_us/productpage.0655502058.html');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('T-shirt with Cuffs', 'Shirt', 'Male', 12.99, 'https://www2.hm.com/en_us/productpage.0671777014.html');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Regular Fit Flannel Shirt', 'Shirt', 'Male', 24.99, 'https://www2.hm.com/en_us/productpage.0763731001.html');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('T-shirt with Cuffs', 'Shirt', 'Male', 12.99, 'https://www2.hm.com/en_us/productpage.0671777033.html');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Blouse with Pleated Collar', 'Shirt', 'Female', 34.99, 'https://www2.hm.com/en_us/productpage.0818166001.html');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Pile Jacket', 'Jacket', 'Female', 59.99, 'https://www2.hm.com/en_us/productpage.0746168005.html');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Pile Coat', 'Coat', 'Female', 79.99, 'https://www2.hm.com/en_us/productpage.0790006002.html');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Aiden Slim Rapid Movement Chino', 'Pants', 'Male', 98, 'https://bananarepublic.gap.com/browse/product.do?pid=795219102&cid=1135879&pcid=35878&vid=1&grid=pds_11_231_1#pdp-page-content');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Untucked Slim-Fit  Luxe Poplin Shirt', 'Shirt', 'Male', 69.5, 'https://bananarepublic.gap.com/browse/product.do?pid=512308012&cid=1144781&pcid=44873&vid=1&grid=pds_0_356_1#pdp-page-content');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Slim-Fit Tech-Stretch Cotton Shirt', 'Shirt', 'Male', 89.5, 'https://bananarepublic.gap.com/browse/product.do?pid=512342002&cid=1144781&pcid=44873&vid=1&grid=pds_18_356_1#pdp-page-content');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Slim Tapered Italian Corduroy Suit Pant', 'Pants', 'Male', 159, 'https://bananarepublic.gap.com/browse/product.do?pid=488759012&cid=1144197&pcid=1072457&vid=1&grid=pds_9_63_1#pdp-page-content');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Wool-blend Mock-Neck Sweater', 'Sweater', 'Male', 119, 'https://bananarepublic.gap.com/browse/product.do?pid=490578002&cid=1119446&pcid=28660&vid=1&grid=pds_8_409_1#pdp-page-content');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Plaid Pleated Midi Skirt', 'Pants', 'Female', 119, 'https://bananarepublic.gap.com/browse/product.do?pid=493415002&cid=1107754&pcid=5022&vid=1&grid=pds_8_73_1#pdp-page-content');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Waffle-Knit Shawl-Collar Sweatshirt', 'Sweater', 'Male', 79.5, 'https://bananarepublic.gap.com/browse/product.do?pid=491430002&cid=1119446&pcid=28660&vid=1&grid=pds_39_409_1#pdp-page-content');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('High-Rise Skinny Coated Jean', 'Pants', 'Female', 110, 'https://bananarepublic.gap.com/browse/product.do?pid=493425002&cid=1144359&pcid=67595&vid=1&grid=pds_12_233_1#pdp-page-content');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Nicklas Leather Sneaker', 'Shoes', 'Male', 128, 'https://bananarepublic.gap.com/browse/product.do?pid=266946002&cid=1032802&pcid=1032801&vid=1&grid=pds_9_59_1#pdp-page-content');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Cotton-Wool Blend Sweater', 'Sweater', 'Male', 89.5, 'https://bananarepublic.gap.com/browse/product.do?pid=490584012&cid=1119446&pcid=28660&vid=1&grid=pds_30_409_1#pdp-page-content');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Everyday Bootie', 'Shoes', 'Female', 168, 'https://bananarepublic.gap.com/browse/product.do?pid=457734002&cid=29096&pcid=29818&vid=1&grid=pds_5_498_1#pdp-page-content');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Vegan Suede Trucker Jacket', 'Jacket', 'Male', 198, 'https://bananarepublic.gap.com/browse/product.do?pid=491424002&cid=1140928&pcid=1016720&vid=1&grid=pds_5_77_1#pdp-page-content');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Water-Resistant Mac Jacket', 'Jacket', 'Male', 249, 'https://bananarepublic.gap.com/browse/product.do?pid=491462002&cid=1140928&pcid=1016720&vid=1&grid=pds_7_77_1#pdp-page-content');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Vegan Suede Bomber Jacket', 'Jacket', 'Male', 179, 'https://bananarepublic.gap.com/browse/product.do?pid=491360012&cid=1140928&pcid=1016720&vid=1&grid=pds_11_77_1#pdp-page-content');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('9" Slim Linen Blend Short', 'Pants', 'Male', 59.5, 'https://bananarepublic.gap.com/browse/product.do?pid=424369022&cid=1117376&pcid=1020051&vid=1&grid=pds_59_62_1#pdp-page-content');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Italian Melton Submariner Coat', 'Coat', 'Male', 329, 'https://bananarepublic.gap.com/browse/product.do?pid=473501012&cid=1140927&pcid=1016720&vid=1&grid=pds_28_77_1#pdp-page-content');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Reindeer Graphic Sweatshirt', 'Sweater', 'Male', 64.5, 'https://bananarepublic.gap.com/browse/product.do?pid=517410012&cid=1092423&pcid=1071875&vid=1&grid=pds_27_72_1#pdp-page-content');

VALUES ('Water-Repellent Quilted Parka', 'Coat', 'Male', 349, 'https://bananarepublic.gap.com/browse/product.do?pid=510240002&cid=1140927&pcid=1016720&vid=1&grid=pds_40_77_1#pdp-page-content');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Piped Crew-Neck Blouse', 'Shirt', 'Female', 69.5, 'https://bananarepublic.gap.com/browse/product.do?pid=472580022&cid=5037&pcid=5037&vid=1&grid=pds_17_287_1&cpos=17&cexp=1350&cid=CategoryIDs%3D5037&cvar=9779&ctype=Listing&cpid=res19102322163383204100366#pdp-page-content');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Soft Satin Pleated Drapey Tank', 'Shirt', 'Female', 59.5, 'https://bananarepublic.gap.com/browse/product.do?pid=510478012&cid=5037&pcid=5037&vid=1&grid=pds_9_287_1&cpos=9&cexp=1350&cid=CategoryIDs%3D5037&cvar=9779&ctype=Listing&cpid=res19102322282732381617060#pdp-page-content');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Leopard Faux Fur Bomber Jacket', 'Jacket', 'Female', 199, 'https://bananarepublic.gap.com/browse/product.do?pid=518512002&cid=1091938&pcid=99915&vid=1&grid=pds_5_125_1#pdp-page-content');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Twill Utility Jacket', 'Jacket', 'Female', 129, 'https://bananarepublic.gap.com/browse/product.do?pid=425037022&cid=99915&pcid=99915&vid=1&grid=pds_14_111_1&cpos=14&cexp=1350&cid=CategoryIDs%3D99915&cvar=9779&ctype=Listing&cpid=res19102322757915270402056#pdp-page-content');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Double-Faced Wrap Coat', 'Coat', 'Female', 249, 'https://bananarepublic.gap.com/browse/product.do?pid=487709012&cid=99915&pcid=99915&vid=1&grid=pds_35_111_1&cpos=36&cexp=1350&cid=CategoryIDs%3D99915&cvar=9779&ctype=Listing&cpid=res19102322482025365569640#pdp-page-content');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Ben Parka', 'Coat', 'Male', 635, 'https://www.apc-us.com/products/wvawa-h30081?variant=29215078809699');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Terre Rouge T-shirt', 'Shirt', 'Male', 110, 'https://www.apc-us.com/products/codcs-h26852?variant=29215125307491');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('New England Raincoat', 'Coat', 'Male', 575, 'https://www.apc-us.com/products/new-england-raincoat-psadj-h01321?variant=19472242278456');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Ollie T-shirt', 'Shirt', 'Male', 105, 'https://www.apc-us.com/products/t-shirt-ollie?variant=19438704754744');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Chris Shorts', 'Pants', 'Male', 210, 'https://www.apc-us.com/products/chris-shorts-codad-h10128?variant=19472259350584');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Rene Shorts', 'Pants', 'Male', 190, 'https://www.apc-us.com/products/rene-shorts-codbd-h10127?variant=19472238870584');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('V.P.C. T-shirt', 'Shirt', 'Male', 110, 'https://www.apc-us.com/products/t-shirt-vpc-h?variant=19438400045112');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Logo T-shirt', 'Shirt', 'Female', 110, 'https://www.apc-us.com/products/logo-t-shirt-codat-f26782?variant=28401707843683');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Axel Jacket', 'Jacket', 'Male', 455, 'https://www.apc-us.com/products/codbr-h02574?variant=29215139037283');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Cyd T-shirt', 'Shirt', 'Female', 90, 'https://www.apc-us.com/products/cyd-t-shirt-codau-f26590?variant=19472259186744');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Bronze Jacket', 'Jacket', 'Male', 645, 'https://www.apc-us.com/products/woajw-h02475?variant=29215080382563');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Jay Sneakers', 'Shoes', 'Male', 325, 'https://www.apc-us.com/products/puaan-h56048?variant=29215223709795');

INSERT INTO clothing (name, type, gender, price, websiteURL)
ALUES ('Spacy Hoodie', 'Sweater', 'Male', 250, 'https://www.apc-us.com/products/codeq-h27557?variant=29710698479715');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Stanislas ankle boots', 'Shoes', 'Male', 580, 'https://www.apc-us.com/products/boots-stanislas?variant=19438587707448');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Logo Sweatshirt', 'Sweater', 'Male', 180, 'https://www.apc-us.com/products/logo-sweatshirt-coday-h27518?variant=19472244604984');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Hide sneakers', 'Shoes', 'Female', 265, 'https://www.apc-us.com/products/minimal-femme-1?variant=19438497792056');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Lise Coat', 'Coat', 'Male', 660, 'https://www.apc-us.com/products/woake-f01398?variant=29215079268451');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Roma Shorts', 'Pants', 'Female', 190, 'https://www.apc-us.com/products/roma-shorts-codab-f10055?variant=19472238706744');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Shanya Skirt', 'Pants', 'Female', 220, 'https://www.apc-us.com/products/jupe-shanya-3?variant=19466469277752');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Marthe Skirt', 'Pants', 'Female', 250, 'https://www.apc-us.com/products/woakk-f06292?variant=29722233634915');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Slim stretch Secret Wash shirt', 'Shirt', 'Male', 69.5, 'https://www.jcrew.com/p/mens_category/shirts/slimshirtshop/slim-stretch-secret-wash-shirt-in-spring-floral-organic-cotton/AC021?color_name=springiscoming-navy');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Slim stretch Secret Wash shirt', 'Shirt', 'Male', 69.5, 'https://www.jcrew.com/p/mens_category/shirts/slimshirtshop/slim-stretch-secret-wash-shirt-in-botanic-print-organic-cotton/AG447?color_name=botanic-garden-flower');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Slim American Pima Cotton Checked Oxford Shirt with Mechanical Stretch', 'Shirt', 'Male', 69.5, 'https://www.jcrew.com/p/mens_category/shirts/slimshirtshop/slim-american-pima-cotton-checked-oxford-shirt-with-mechanical-stretch/J1032?color_name=navy-mahogany');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Fair Isle Lambswool Crewneck Sweater', 'Sweater', 'Male', 128, 'https://www.jcrew.com/p/mens_category/sweaters/pullover/fair-isle-lambswool-crewneck-sweater/AF191?color_name=fairisle-hthr-flannel');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Merino Wool Jacquard Crewneck Sweater', 'Sweater', 'Male', 98, 'https://www.jcrew.com/p/mens_category/sweaters/pullover/merino-wool-jacquard-crewneck-sweater/AD407?color_name=marled-barley');
INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Rugged Merino Wool Half-Zip Sweater', 'Sweater', 'Male', 98, 'https://www.jcrew.com/p/mens_category/sweaters/pullover/rugged-merino-wool-halfzip-sweater/J7612?color_name=hthr-maroon');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Ludlow Insulated Trench Coat', 'Coat', 'Male', 228, 'https://www.jcrew.com/p/mens_category/coats_and_jackets/topcoat/ludlow-insulated-trench-coat-with-ecofriendly-primaloft/AA298?color_name=sage');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Dock Peacoat', 'Coat', 'Male', 298, 'https://www.jcrew.com/p/mens_category/coats_and_jackets/peacoat/dock-peacoat-with-thinsulate/H0485?color_name=evergreen-heather');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Ludlow Car Coat', 'Coat', 'Male', 450, 'https://www.jcrew.com/p/mens_category/coats_and_jackets/topcoat/ludlow-car-coat-in-woolcashmere/AA148?color_name=light-heather-grey');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Fulton Insulated Jacket', 'Jacket', 'Male', 248, 'https://www.jcrew.com/p/mens_category/coats_and_jackets/lightweight_jacket/fulton-insulated-jacket-with-ecofriendly-primaloft/AA142?color_name=midnight');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Sussex Quilted Blazer', 'Jacket', 'Male', 148, 'https://www.jcrew.com/p/mens_category/coats_and_jackets/lightweight_jacket/sussex-quilted-blazer-with-ecofriendly-primaloft/AC258?color_name=cadet-navy');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Field Mechanic Jacket', 'Jacket', 'Male', 198, 'https://www.jcrew.com/p/mens_category/coats_and_jackets/lightweight_jacket/field-mechanic-jacket/B1552?color_name=olive-moss');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Slub Cotton T-Shirt', 'Shirt', 'Male', 34.5, 'https://www.jcrew.com/p/mens_category/polos_tees/slubcotton/slub-cotton-tshirt-in-ivory-stripe/J1914?color_name=ivory');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Crab Graphic T-Shirt', 'Shirt', 'Male', 24.5, 'https://www.jcrew.com/p/mens_category/polos_tees/essential/crab-graphic-tshirt/J1845?color_name=deep-ultramarine-crab');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Rugby Crewneck Shirt', 'Shirt', 'Male', 69.5, 'https://www.jcrew.com/p/mens_category/polos_tees/novelty/rugby-crewneck-shirt-in-pieced-stripe/AD307?color_name=navy-pieced-stripe');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('484 Slim-fit Pants in Stretched Brushed Twill', 'Pants', 'Male', 89.5, 'https://www.jcrew.com/p/mens_category/pants/slim/484-slimfit-pant-in-stretch-brushed-twill/AE579?color_name=salt');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('484 Slim-fit Lightweight Garment Dyed Stretch Chino', 'Pants', 'Male', 68, 'https://www.jcrew.com/p/mens_category/pants/slim/484-slimfit-lightweight-garmentdyed-stretch-chino/G1186?color_name=honey-brown');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Ludlow Essential Slim-fit Pant', 'Pants', 'Male', 148, 'https://www.jcrew.com/p/mens_category/pants/slim/ludlow-essential-slimfit-pant-in-glen-plaid-stretch-fourseason-wool/AC140?color_name=grey-blue-black-glen');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('9" Oxford Short', 'Pants', 'Male', 65, 'https://www.jcrew.com/p/mens_category/shorts/9inchshort/9-oxford-short/K8790?color_name=light-blue-oxford');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('9" Stretch Short', 'Pants', 'Male', 65, 'https://www.jcrew.com/p/mens_category/shorts/9inchshort/9-stretch-short/C8937?color_name=white');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Gemstone Sweater', 'Sweater', 'Female', 128, 'https://www.jcrew.com/p/womens_category/sweaters/pullover/gemstone-sweater-in-supersoft-yarn/AF013?color_name=hthr-acorn');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Pointelle Cable Sweater', 'Sweater', 'Female', 98, 'https://www.jcrew.com/p/womens_category/sweaters/pullover/pointelle-cable-sweater/AF007?color_name=hthr-grey');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Tippi Sweater in Ribbed Merino', 'Sweater', 'Female', 89.5, 'https://www.jcrew.com/p/womens_category/sweaters/pullover/tippi-sweater-in-ribbed-merino/AE498?color_name=vintage-burgundy');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Chateau Parka', 'Coat', 'Female', 375, 'https://www.jcrew.com/p/womens_category/coats_and_jackets/woolandwoolblend/chateau-parka-in-italian-stadiumcloth-wool/J5488?color_name=sea-spray');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Daphne Topcoat', 'Coat', 'Female', 325, 'https://www.jcrew.com/p/womens_category/coats_and_jackets/woolandwoolblend/daphne-topcoat-in-italian-tweed/H2076?color_name=burgundy-black-jungle');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Car Coat', 'Coat', 'Female', 398, 'https://www.jcrew.com/p/womens_category/coats_and_jackets/woolandwoolblend/car-coat-in-italian-doublecloth-wool/AF005?color_name=dark-curry-w');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Slim Perfect Long-Sleeve T-Shirt', 'Shirt', 'Female', 39.5, 'https://www.jcrew.com/p/womens_category/tshirts_tanktops/longsleevetshirts/slim-perfect-longsleeve-tshirt-in-stripes/J1638?color_name=coral-red-multi-emmet-st');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Tissue Turtleneck', 'Shirt', 'Female', 39.5, 'https://www.jcrew.com/p/womens_category/tshirts_tanktops/longsleevetshirts/tissue-turtleneck-in-floral/AC646?color_name=black-beige');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Salut Sweatshirt', 'Shirt', 'Female', 55, 'https://www.jcrew.com/p/womens_category/tshirts_tanktops/longsleevetshirts/salut-sweatshirt/AE249?color_name=iced-orchid');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Pull-on Peyton Pant', 'Pants', 'Female', 110, 'https://www.jcrew.com/p/womens_category/pants/wideleg/pullon-peyton-pant-in-velvet/AB650?color_name=skylark-blue');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Full-Length Cameron Pant', 'Pants', 'Female', 89.5, 'https://www.jcrew.com/p/womens_category/pants/slim/fulllength-cameron-pant-in-fourseason-stretch/K2089?color_name=hthr-saddle');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('Paper-bag Short in Seersucker', 'Pants', 'Female', 69.5, 'https://www.jcrew.com/p/womens_category/shorts/3inch/paperbag-short-in-seersucker/L4986?color_name=white-blossom');

INSERT INTO clothing (name, type, gender, price, websiteURL)
VALUES ('SeaVees X J.Crew Coronado boots', 'Shoes', 'Male', 160, 'https://www.jcrew.com/p/mens_category/shoes_sneakers/exclusives/seavees-x-jcrew-coronado-boots/M1590?color_name=cocoa-brown');

INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0456032021.html', 'https://lp2.hm.com/hmgoepprod?set=source[/8c/73/8c73a308a4b1c70b81713ed5b020426ffaf5a517.jpg],origin[dam],category[men_shorts],type[DESCRIPTIVESTILLLIFE],res[x],hmver[1]&call=url[file:/product/fullscreen]', 'Dark Blue/Floral', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0456032021.html', 'https://lp2.hm.com/hmgoepprod?set=source[/3a/17/3a17ce4ab91d01dcf68b61a831f122ceaa8b5fd9.jpg],origin[dam],category[men_shorts],type[LOOKBOOK],res[s],hmver[2]&call=url[file:/product/main]', 'Khaki Green/Patterned', 'Green');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0685814005.html', 'https://lp2.hm.com/hmgoepprod?set=source[/ca/77/ca771008369f7523aa8d7b6685781eac533ddb60.jpg],origin[dam],category[men_hoodiessweatshirts_hoodies],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Beige', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0685814005.html', 'https://lp2.hm.com/hmgoepprod?set=source[/ca/77/ca771008369f7523aa8d7b6685781eac533ddb60.jpg],origin[dam],category[men_hoodiessweatshirts_hoodies],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Black', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0685814005.html', 'https://lp2.hm.com/hmgoepprod?set=source[/22/80/2280ebf8c1fc906092f15a6d201e6b024ea45af9.jpg],origin[dam],category[men_hoodiessweatshirts_hoodies],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Gray Melange', 'Gray ');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0685814005.html', 'https://lp2.hm.com/hmgoepprod?set=source[/ea/3d/ea3db9d2b23f95f2fde092b012e6b0b8ccfb059b.jpg],origin[dam],category[men_hoodiessweatshirts_hoodies],type[DESCRIPTIVESTILLLIFE],res[m],hmver[2]&call=url[file:/product/main]', 'White', 'White');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0685814005.html', 'https://lp2.hm.com/hmgoepprod?set=source[/cc/c1/ccc12993f48457cc480b9d58e3dc27f412680493.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],hmver[1]&call=url[file:/product/main]', 'Pink', 'Pink');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0685814005.html', 'https://lp2.hm.com/hmgoepprod?set=source[/09/03/09032c68f55890c4f163c0dd53fe487e79c146fd.jpg],origin[dam],category[men_hoodiessweatshirts_hoodies],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Burgundy', 'Burgundy');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0685814005.html', 'https://lp2.hm.com/hmgoepprod?set=source[/56/be/56be914e33673f268090f0db06cb085724a94e6e.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Khaki Green', 'Green');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0685814005.html', 'https://lp2.hm.com/hmgoepprod?set=source[/22/e9/22e9dcd0d18684ea5c9caf50ad3b485fbfa128df.jpg],origin[dam],category[men_hoodiessweatshirts_hoodies],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Dark Blue', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0685814005.html', 'https://lp2.hm.com/hmgoepprod?set=source[/fb/1c/fb1ce215dffeb8f456e75a20b6559aec5f1c7046.jpg],origin[dam],category[men_hoodiessweatshirts_hoodies],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Bright Red', 'Red');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0685814005.html', 'https://lp2.hm.com/hmgoepprod?set=source[/24/9d/249deb8906b9bc6ea8aa74f12cc3427cff47b272.jpg],origin[dam],category[men_hoodiessweatshirts_hoodies],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Light Purple', 'Purple');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0685814005.html', 'https://lp2.hm.com/hmgoepprod?set=source[/0d/21/0d21b2ff72e8ad6a065d8f6e511c7987be651a6d.jpg],origin[dam],category[men_hoodiessweatshirts_hoodies],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Dark gray melange', 'Gray ');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0685814005.html', 'https://lp2.hm.com/hmgoepprod?set=source[/73/7e/737e9d1d556b12cd117cc45c875768175997c064.jpg],origin[dam],category[men_hoodiessweatshirts_hoodies],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Dark gray', 'Gray ');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0685814005.html', 'https://lp2.hm.com/hmgoepprod?set=source[/9b/a2/9ba28321926c9f1000f324cd2cc950752136f2d5.jpg],origin[dam],category[men_hoodiessweatshirts_hoodies],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Yellow', 'Yellow');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0685814005.html', 'https://lp2.hm.com/hmgoepprod?set=source[/50/6c/506c655ff7269506eb5b4bd8ad2ad670a30a0374.jpg],origin[dam],category[men_hoodiessweatshirts_hoodies],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Dark Green', 'Green');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0685814005.html', 'https://lp2.hm.com/hmgoepprod?set=source[/82/f9/82f9a0d1871d98ec4b991112a4008094c8c3c595.jpg],origin[dam],category[men_hoodiessweatshirts_hoodies],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Light Pink', 'Pink');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0685814005.html', 'https://lp2.hm.com/hmgoepprod?set=source[/c7/e8/c7e8fea56376f629621401c543e854a6c3dc4489.jpg],origin[dam],category[men_hoodiessweatshirts_hoodies],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Red', 'Red');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0685814005.html', 'https://lp2.hm.com/hmgoepprod?set=source[/90/ff/90ffd760cececd0082f8d3664a5c010168fa3434.jpg],origin[dam],category[men_hoodiessweatshirts_hoodies],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Dark Beige', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0782880002.html', 'https://lp2.hm.com/hmgoepprod?set=source[/43/ef/43ef534deef3b9c9dbdcc794a7c501a24c31c90f.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Black/Nasa', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0782880002.html', 'https://lp2.hm.com/hmgoepprod?set=source[/5a/7d/5a7dc1217403ca22be21e2ac3144474c46b45ac1.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Beige/Nasa', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0782880002.html', 'https://lp2.hm.com/hmgoepprod?set=source[/b1/83/b183fb74593db2c52a71b1e8d28d5d6be8bd7e43.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'White/Nasa', 'White');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0815456001.html', 'https://lp2.hm.com/hmgoepprod?set=source[/fb/57/fb57adde72d8cb371a5e0e71cfa1d623ea4ec382.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[x],hmver[1]&call=url[file:/product/fullscreen]', 'Black', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0815456001.html', 'https://lp2.hm.com/hmgoepprod?set=source[/3e/22/3e22c6ea5b24035a90ae75a1550e281a15bf27c0.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[x],hmver[1]&call=url[file:/product/fullscreen]', 'Dark Blue', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0815456001.html', 'https://lp2.hm.com/hmgoepprod?set=source[/dd/1c/dd1c00497da1ce1929b3de13ff86a78242bc978e.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[x],hmver[1]&call=url[file:/product/fullscreen]', 'Beige', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0777504001.html', 'https://lp2.hm.com/hmgoepprod?set=source[/34/dc/34dc1008890f8c29dca75b80ec362d591a248384.jpg],origin[dam],category[ladies_trousers_chinosslacks],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Gray/Checked', 'Gray ');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0777504001.html', 'https://lp2.hm.com/hmgoepprod?set=source[/9b/40/9b403c62b7c7a26ea0cb5e7a05226eb38c435a25.jpg],origin[dam],category[ladies_trousers_chinosslacks],type[DESCRIPTIVESTILLLIFE],res[s],hmver[1]&call=url[file:/product/main]', 'Beige/Checked', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0777504001.html', 'https://lp2.hm.com/hmgoepprod?set=source[/f0/eb/f0ebb838825c9d6dce0dc104b977282feff0841b.jpg],origin[dam],category[ladies_trousers_chinosslacks],type[DESCRIPTIVESTILLLIFE],res[s],hmver[1]&call=url[file:/product/main]', 'Black', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0543548001.html', 'https://lp2.hm.com/hmgoepprod?set=source[/c9/40/c940dfa77bc2fa02a61229b45ab7c2f0d9caf4fc.jpg],origin[dam],category[men_sport_jackets],type[DESCRIPTIVESTILLLIFE],res[m],hmver[2]&call=url[file:/product/main]', 'Black', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0543548001.html', 'https://lp2.hm.com/hmgoepprod?set=source[/34/a2/34a2636b50e85de293f87858ec62e02ec1212877.jpg],origin[dam],category[men_sport_jackets],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Dark Gray Melange', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0543548001.html', 'https://lp2.hm.com/hmgoepprod?set=source[/13/8e/138ecee37e7e464060a66ada4bdacb1e5a34a0e1.jpg],origin[dam],category[men_sport_jackets],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Dark Green', 'Green');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0793018002.html', 'https://lp2.hm.com/hmgoepprod?set=source[/30/e0/30e0d3679e08d42062106dd8246b68e6846a3783.jpg],origin[dam],category[men_cardigansjumpers_jumpers],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Black', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0793018002.html', 'https://lp2.hm.com/hmgoepprod?set=source[/b6/69/b669d33c0315a9f8064f914cdafcab1df132b298.jpg],origin[dam],category[men_cardigansjumpers_jumpers],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Dark Gray', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0795334001.html', 'https://lp2.hm.com/hmgoepprod?set=source[/e3/08/e308c2b50bac6205952f815e62f50c01680f3349.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[s],hmver[1]&call=url[file:/product/main]', 'Denim blue/Mickey Mouse', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0788172001.html', 'https://lp2.hm.com/hmgoepprod?set=source[/45/cd/45cde70d7b3816aa930b7cf38ed81d7febf9897e.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Beige Melange', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0788172001.html', 'https://lp2.hm.com/hmgoepprod?set=source[/a3/b7/a3b77cad3fec75f39290ff916c9dc0e2a462af0f.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Black', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0663382003.html', 'https://lp2.hm.com/hmgoepprod?set=source[/ec/79/ec7968e4ec4a868b084ea247deb17b25a23e2fc9.jpg],origin[dam],category[men_shoes_boots],type[DESCRIPTIVESTILLLIFE],res[s],hmver[2]&call=url[file:/product/main]', 'Tawny brown', 'Brown');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0663382003.html', 'https://lp2.hm.com/hmgoepprod?set=source[/67/82/6782e21443ac13d0b5e8cd035b82b73890cac09c.jpg],origin[dam],category[men_shoes_boots],type[DESCRIPTIVESTILLLIFE],res[s],hmver[1]&call=url[file:/product/main]', 'Light taupe', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0755629001.html', 'https://lp2.hm.com/hmgoepprod?set=source[/85/fe/85fe801da03ff95d005126e4755a2ca7e8761fe0.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Beige', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0755629001.html', 'https://lp2.hm.com/hmgoepprod?set=source[/ce/46/ce467030fbfcdb5673b62638f74ace2a8b528dc8.jpg],origin[dam],category[men_all],type[DESCRIPTIVESTILLLIFE],res[m],hmver[2]&call=url[file:/product/main]', 'Dark Blue', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0755629001.html', 'https://lp2.hm.com/hmgoepprod?set=source[/36/98/3698b63b328f185e7b1f05e90186d0349c606cc9.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Black', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0766112001.html', 'https://lp2.hm.com/hmgoepprod?set=source[/54/7c/547cd5eae60b84d94310784578f621f006a5eb75.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'White/Donald Duck', 'White');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0788301003.html', 'https://lp2.hm.com/hmgoepprod?set=source[/f7/cc/f7cce46da3cf69f7d014156f0b434a0f8d0b419f.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Dark Grey/Checkered', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0788301003.html', 'https://lp2.hm.com/hmgoepprod?set=source[/ff/c5/ffc53a30ba60202b9314a9748fd684990dc39421.jpg],origin[dam],category[men_jacketscoats_coats],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Beige', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0788301003.html', 'https://lp2.hm.com/hmgoepprod?set=source[/fb/64/fb642a6242f644a93b430446935e7c477563dfe6.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Black', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0788301003.html', 'https://lp2.hm.com/hmgoepprod?set=source[/c8/09/c80909b0d6314dc2555d7f75b7affb1612f051f3.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Dark Gray/Herringbone Pattern', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0762169005.html', 'https://lp2.hm.com/hmgoepprod?set=source[/ee/b5/eeb5a5160d5675e908a973ad4477a8717c7ca7d3.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Beige', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0762169005.html', 'https://lp2.hm.com/hmgoepprod?set=source[/0b/21/0b21ab10cc007b8be4f45121d736328e18f92e99.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Black', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0797618001.html', 'https://lp2.hm.com/hmgoepprod?set=source[/95/e7/95e70a76dd680ad753ff8dd26c5f761475efe607.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[s],hmver[1]&call=url[file:/product/main]', 'Black', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0797618001.html', 'https://lp2.hm.com/hmgoepprod?set=source[/0e/ae/0eaebaa70d58ef4b43ec290fdc5196127436c81e.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[s],hmver[1]&call=url[file:/product/main]', 'Beige', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0634744009.html', 'https://lp2.hm.com/hmgoepprod?set=source[/72/6a/726a170d3e8030d508b50474ed901bc1ab31036e.jpg],origin[dam],category[men_jacketscoats_bikerjackets],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Tawny brown', 'Brown');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0634744009.html', 'https://lp2.hm.com/hmgoepprod?set=source[/6e/9d/6e9d6b67d78107c271712eefba563f2c3616e1b0.jpg],origin[dam],category[men_jacketscoats_bikerjackets],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Dark Blue', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0634744009.html', 'https://lp2.hm.com/hmgoepprod?set=source[/f5/f8/f5f8c4ba1e22488ac690d08cd1a26101750d55d7.jpg],origin[dam],category[men_jacketscoats_bikerjackets],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Black', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0753481003.html', 'https://lp2.hm.com/hmgoepprod?set=source[/97/02/97024e094560780179f38b74eff23416250c980d.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Red', 'Red');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0753481003.html', 'https://lp2.hm.com/hmgoepprod?set=source[/45/79/4579b0fa593bf1eaa194648284aff8c3565e7f46.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Khaki Green/Patterned', 'Green');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0753481003.html', 'https://lp2.hm.com/hmgoepprod?set=source[/76/61/7661b9b93c349d7d4e740eba9d2a33530d54c772.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Black', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0655502058.html', 'https://lp2.hm.com/hmgoepprod?set=source[/24/06/24069756196b5bc39ab09f71526648de76dbe8a6.jpg],origin[dam],category[men_tshirtstanks_shortsleeve],type[DESCRIPTIVESTILLLIFE],res[s],hmver[1]&call=url[file:/product/main]', 'White/Atari', 'White');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0655502058.html', 'https://lp2.hm.com/hmgoepprod?set=source[/75/48/754871f59e3270b12f2ab9f7262f769d5f96f388.jpg],origin[dam],category[men_tshirtstanks_shortsleeve],type[DESCRIPTIVESTILLLIFE],res[s],hmver[1]&call=url[file:/product/main]', 'Dark gray/The Rolling Stones', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0655502058.html', 'https://lp2.hm.com/hmgoepprod?set=source[/e2/4d/e24df7890e5c03f12eff642604fd873e87496c07.jpg],origin[dam],category[men_tshirtstanks_shortsleeve],type[DESCRIPTIVESTILLLIFE],res[s],hmver[1]&call=url[file:/product/main]', 'Dark blue/Snoopy', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0671777014.html', 'https://lp2.hm.com/hmgoepprod?set=source[/b0/5a/b05abdf73430f54e89b7cbea3ba6d94fe0c52014.jpg],origin[dam],category[men_tshirtstanks_shortsleeve],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Light Gray melange/tigers', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0763731001.html', 'https://lp2.hm.com/hmgoepprod?set=source[/99/db/99dbd68f960959c4174cc983b0aae76983c77c5b.jpg],origin[dam],category[men_newarrivals_clothes],type[DESCRIPTIVESTILLLIFE],res[s],hmver[1]&call=url[file:/product/main]', 'Dark Blue/plaid', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0763731001.html', 'https://lp2.hm.com/hmgoepprod?set=source[/b6/b0/b6b005c8b63f80a5b74995c328ebf6b78d112181.jpg],origin[dam],category[men_newarrivals_clothes],type[DESCRIPTIVESTILLLIFE],res[s],hmver[1]&call=url[file:/product/main]', 'Gray Melange', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0763731001.html', 'https://lp2.hm.com/hmgoepprod?set=source[/20/94/209439062b614a55bbd3bc9bc9d6f889ac6912b6.jpg],origin[dam],category[men_newarrivals_clothes],type[DESCRIPTIVESTILLLIFE],res[s],hmver[1]&call=url[file:/product/main]', 'Red/plaid', 'Red');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0671777033.html', 'https://lp2.hm.com/hmgoepprod?set=source[/bb/d2/bbd2649110979f50a64c75d5a2affede151cf3a9.jpg],origin[dam],category[men_tshirtstanks_shortsleeve],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Black/flamingos', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0818166001.html', 'https://lp2.hm.com/hmgoepprod?set=source[/ae/3c/ae3cf1714cc98d4b90cec9bf92991932abe0d9b3.jpg],origin[dam],category[ladies_shirtsblouses_blouses],type[DESCRIPTIVESTILLLIFE],res[s],hmver[1]&call=url[file:/product/main]', 'Cream', 'White');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0746168005.html', 'https://lp2.hm.com/hmgoepprod?set=source[/d8/2b/d82be2c898eb778979dd20073f17d3ce5c42d371.jpg],origin[dam],category[ladies_jacketscoats_jackets],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'White', 'White');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0746168005.html', 'https://lp2.hm.com/hmgoepprod?set=source[/6d/20/6d20b86094136ad76906761bf1941dd0d63afede.jpg],origin[dam],category[ladies_jacketscoats_jackets],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Black', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0790006002.html', 'https://lp2.hm.com/hmgoepprod?set=source[/d8/bc/d8bcc5a290842b8c39939a46855a7712b5892f84.jpg],origin[dam],category[ladies_jacketscoats_coats],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Gray Green', 'Green');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0790006002.html', 'https://lp2.hm.com/hmgoepprod?set=source[/44/d7/44d7a3dd7f0041d51b3db9af1953fbc0a8ec0aa3.jpg],origin[dam],category[ladies_jacketscoats_coats],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Black', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www2.hm.com/en_us/productpage.0790006002.html', 'https://lp2.hm.com/hmgoepprod?set=source[/31/24/31246e7daa0e58ead6650af5a31f94e52c463232.jpg],origin[dam],category[ladies_jacketscoats_coats],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]', 'Beige', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=795219102&cid=1135879&pcid=35878&vid=1&grid=pds_11_231_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/583/834/cn17583834.jpg', 'Khaki', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=795219102&cid=1135879&pcid=35878&vid=1&grid=pds_11_231_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0016/808/526/cn16808526.jpg', 'Navy Blue', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=795219102&cid=1135879&pcid=35878&vid=1&grid=pds_11_231_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/303/368/cn17303368.jpg', 'Caper Green', 'Green');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=512308012&cid=1144781&pcid=44873&vid=1&grid=pds_0_356_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/700/098/cn17700098.jpg', 'Light Blue', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=512308012&cid=1144781&pcid=44873&vid=1&grid=pds_0_356_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/700/087/cn17700087.jpg', 'Orange Plaid', 'Orange');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=512308012&cid=1144781&pcid=44873&vid=1&grid=pds_0_356_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/700/066/cn17700066.jpg', 'Navy Plaid', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=512342002&cid=1144781&pcid=44873&vid=1&grid=pds_18_356_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/707/141/cn17707141.jpg', 'White Print', 'White');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=488759012&cid=1144197&pcid=1072457&vid=1&grid=pds_9_63_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/668/949/cn17668949.jpg', 'Navy', 'Navy');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=490578002&cid=1119446&pcid=28660&vid=1&grid=pds_8_409_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/834/732/cn17834732.jpg', 'Stone Gray', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=490578002&cid=1119446&pcid=28660&vid=1&grid=pds_8_409_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/380/953/cn17380953.jpg', 'Dark Gray', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=493415002&cid=1107754&pcid=5022&vid=1&grid=pds_8_73_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/364/848/cn17364848.jpg', 'Black & White Houndstooth Plaid', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=491430002&cid=1119446&pcid=28660&vid=1&grid=pds_39_409_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/767/016/cn17767016.jpg', 'Charcoal Gray', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=491430002&cid=1119446&pcid=28660&vid=1&grid=pds_39_409_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/591/977/cn17591977.jpg', 'Lightening Blue', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=491430002&cid=1119446&pcid=28660&vid=1&grid=pds_39_409_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/591/965/cn17591965.jpg', 'Red Wine', 'Red');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=493425002&cid=1144359&pcid=67595&vid=1&grid=pds_12_233_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/536/451/cn17536451.jpg', 'Black', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=266946002&cid=1032802&pcid=1032801&vid=1&grid=pds_9_59_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0014/364/728/cn14364728.jpg', 'Black Leather', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=266946002&cid=1032802&pcid=1032801&vid=1&grid=pds_9_59_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0014/364/575/cn14364575.jpg', 'Cognac Brown Leather', 'Brown');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=490584012&cid=1119446&pcid=28660&vid=1&grid=pds_30_409_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/695/331/cn17695331.jpg', 'New Olive Green', 'Green');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=490584012&cid=1119446&pcid=28660&vid=1&grid=pds_30_409_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/652/106/cn17652106.jpg', 'Navy', 'Navy');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=491424002&cid=1140928&pcid=1016720&vid=1&grid=pds_5_77_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/301/985/cn17301985.jpg', 'Wilderness Green', 'Green');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=457734002&cid=29096&pcid=29818&vid=1&grid=pds_5_498_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/640/781/cn17640781.jpg', 'Pewter Suede', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=457734002&cid=29096&pcid=29818&vid=1&grid=pds_5_498_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/496/408/cn17496408.jpg', 'Espresso Suede', 'Brown');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=457734002&cid=29096&pcid=29818&vid=1&grid=pds_5_498_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0016/840/900/cn16840900.jpg', 'Sand Suede', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=491462002&cid=1140928&pcid=1016720&vid=1&grid=pds_7_77_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/565/341/cn17565341.jpg', 'Navy', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=491360012&cid=1140928&pcid=1016720&vid=1&grid=pds_11_77_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/282/160/cn17282160.jpg', 'Preppy Navy & Moondust Gray', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=491360012&cid=1140928&pcid=1016720&vid=1&grid=pds_11_77_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/282/105/cn17282105.jpg', 'Black', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=473501012&cid=1140927&pcid=1016720&vid=1&grid=pds_28_77_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/910/695/cn17910695.jpg', 'Black & Gray', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=473501012&cid=1140927&pcid=1016720&vid=1&grid=pds_28_77_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/873/034/cn17873034.jpg', 'Flight Jacket Green', 'Brown');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=424369022&cid=1117376&pcid=1020051&vid=1&grid=pds_59_62_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0016/725/430/cn16725430.jpg', ' Sandcastle Beige', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=510240002&cid=1140927&pcid=1016720&vid=1&grid=pds_40_77_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/911/222/cn17911222.jpg', 'Navy', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=517410012&cid=1092423&pcid=1071875&vid=1&grid=pds_27_72_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/659/090/cn17659090.jpg', 'Transition Cream White', 'White');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=517410012&cid=1092423&pcid=1071875&vid=1&grid=pds_27_72_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/858/940/cn17858940.jpg', 'Heather Gray', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=472580022&cid=5037&pcid=5037&vid=1&grid=pds_17_287_1&cpos=17&cexp=1350&cid=CategoryIDs%3D5037&cvar=9779&ctype=Listing&cpid=res19102322163383204100366#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0016/966/731/cn16966731.jpg', 'Warm White & Black Floral', 'White');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=510478012&cid=5037&pcid=5037&vid=1&grid=pds_9_287_1&cpos=9&cexp=1350&cid=CategoryIDs%3D5037&cvar=9779&ctype=Listing&cpid=res19102322282732381617060#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/303/261/cn17303261.jpg', 'Sunny Yellow', 'Yellow');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=510478012&cid=5037&pcid=5037&vid=1&grid=pds_9_287_1&cpos=9&cexp=1350&cid=CategoryIDs%3D5037&cvar=9779&ctype=Listing&cpid=res19102322282732381617060#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/506/947/cn17506947.jpg', 'Royal Fluchsia', 'Purple');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=510478012&cid=5037&pcid=5037&vid=1&grid=pds_9_287_1&cpos=9&cexp=1350&cid=CategoryIDs%3D5037&cvar=9779&ctype=Listing&cpid=res19102322282732381617060#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/339/964/cn17339964.jpg', 'Wine Red', 'Red');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=518512002&cid=1091938&pcid=99915&vid=1&grid=pds_5_125_1#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/865/964/cn17865964.jpg', 'Leopard Print', 'Brown');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=425037022&cid=99915&pcid=99915&vid=1&grid=pds_14_111_1&cpos=14&cexp=1350&cid=CategoryIDs%3D99915&cvar=9779&ctype=Listing&cpid=res19102322757915270402056#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/458/237/cn17458237.jpg', 'Deep Olive Green', 'Green');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=425037022&cid=99915&pcid=99915&vid=1&grid=pds_14_111_1&cpos=14&cexp=1350&cid=CategoryIDs%3D99915&cvar=9779&ctype=Listing&cpid=res19102322757915270402056#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/465/740/cn17465740.jpg', 'Stone Gray', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=487709012&cid=99915&pcid=99915&vid=1&grid=pds_35_111_1&cpos=36&cexp=1350&cid=CategoryIDs%3D99915&cvar=9779&ctype=Listing&cpid=res19102322482025365569640#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/539/122/cn17539122.jpg', 'Taupe', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=487709012&cid=99915&pcid=99915&vid=1&grid=pds_35_111_1&cpos=36&cexp=1350&cid=CategoryIDs%3D99915&cvar=9779&ctype=Listing&cpid=res19102322482025365569640#pdp-page-content', 'https://bananarepublic.gap.com/webcontent/0017/453/517/cn17453517.jpg', 'Charcoal Gray', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/wvawa-h30081?variant=29215078809699', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/WVAWA-H30081_JAC_00_1000x.jpg?v=1571712237', 'Military Khaki', 'Green');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/codcs-h26852?variant=29215125307491', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/CODCS-H26852_AAB_00_1000x.jpg?v=1571712204', 'White', 'White');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/new-england-raincoat-psadj-h01321?variant=19472242278456', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/PSADJ-H01321_KAG_00_1000x.jpg?v=1571712176', 'Evergreen', 'Green');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/t-shirt-ollie?variant=19438704754744', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/CODCS-H26819_IAK_00_1000x.jpg?v=1571712178', 'Navy', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/t-shirt-ollie?variant=19438704754744', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/CODCS-H26819_AAB_00_1000x.jpg?v=1571712178', 'White', 'White');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/t-shirt-ollie?variant=19438704754744', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/CODCS-H26819_KAB_00_1000x.jpg?v=1571712178', 'Green', 'Green');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/chris-shorts-codad-h10128?variant=19472259350584', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/CODAD-H10128_LZA_00_1000x.jpg?v=1571712177', 'Near Black', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/rene-shorts-codbd-h10127?variant=19472238870584', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/CODBD-H10127_JAA_00_1000x.jpg?v=1571712177', 'Khaki', 'Green');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/rene-shorts-codbd-h10127?variant=19472238870584', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/CODBD-H10127_LZZ_00_1000x.jpg?v=1571712177', 'Black', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/t-shirt-vpc-h?variant=19438400045112', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/H26586_1000x.jpg?v=1571712088', 'White', 'White');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/logo-t-shirt-codat-f26782?variant=28401707843683', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/CODAT-F26782_PLA_00_1000x.jpg?v=1571712175', 'Heather Gray', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/logo-t-shirt-codat-f26782?variant=28401707843683', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/CODAT-F26782_PIL_00_1000x.jpg?v=1571712175', 'Heather Indigo', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/codbr-h02574?variant=29215139037283', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/CODBR-H02574_IAI_00_1000x.jpg?v=1571712203', 'Indigo', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/woajw-h02475?variant=29215080382563', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/WOAJW-H02475_PBC_00_1000x.jpg?v=1571712236', 'Heather Beige', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/woajw-h02475?variant=29215080382563', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/WOAJW-H02475_PIA_00_1000x.jpg?v=1571712236', 'Heather Navy Blue', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/cyd-t-shirt-codau-f26590?variant=19472259186744', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/CODAU-F26590_FAA_00_1000x.jpg?v=1571712175', 'Pink', 'Pink');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/codeq-h27557?variant=29710698479715', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/CODEQ-H27557_KAA_00_1000x.jpg?v=1571712244', 'Green', 'Green');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/codeq-h27557?variant=29710698479715', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/CODEQ-H27557_DAA_00_1000x.jpg?v=1571712244', 'Yellow', 'Yellow');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/codeq-h27557?variant=29710698479715', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/CODEQ-H27557_LZZ_00_1000x.jpg?v=1571712244', 'Black', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/puaan-h56048?variant=29215223709795', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/puaan-h56048_lad_00_77e3b53c-63ae-4769-a4a6-c4156a593f1c_1000x.jpg?v=1571712233', 'Charcoal Gray', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/boots-stanislas?variant=19438587707448', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/pxbls-h54156_lzz_00_1000x.jpg?v=1571712169', 'Black', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/logo-sweatshirt-coday-h27518?variant=19472244604984', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/CODAY-H27518_IAK_00_1000x.jpg?v=1571712178', 'Burgundy', 'Red');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/logo-sweatshirt-coday-h27518?variant=19472244604984', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/CODAY-H27518_GAC_00_1000x.jpg?v=1571712178', 'Dark Navy Blue', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/minimal-femme-1?variant=19438497792056', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/COCMG-H56051_AAB_00_1000x.jpg?v=1571712136', 'White', 'White');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/woake-f01398?variant=29215079268451', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/WOAKE-F01398_IAA_00_1000x.jpg?v=1571712237', 'Ecru', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/roma-shorts-codab-f10055?variant=19472238706744', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/CODAB-F10055_IAL_00_1000x.jpg?v=1571712175', 'Stonewashed Indigo', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/jupe-shanya-3?variant=19466469277752', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/CODEA-F06253_KAG_00_1000x.jpg?v=1571712197', 'Evergreen', 'Green');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/jupe-shanya-3?variant=19466469277752', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/CODEA-F06253_BAC_00_1000x.jpg?v=1571712197', 'Dark Beige', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.apc-us.com/products/woakk-f06292?variant=29722233634915', 'https://cdn.shopify.com/s/files/1/0007/0051/4360/products/WOAKK-F06292_LZA_00_1000x.jpg?v=1571712245', 'Near Black', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/shirts/slimshirtshop/slim-stretch-secret-wash-shirt-in-spring-floral-organic-cotton/AC021?color_name=springiscoming-navy', 'https://www.jcrew.com/s7-img-facade/AA281_PA6860?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Springiscoming Navy', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/shirts/slimshirtshop/slim-stretch-secret-wash-shirt-in-botanic-print-organic-cotton/AG447?color_name=botanic-garden-flower', 'https://www.jcrew.com/s7-img-facade/AE718_PA7198?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Botanic Garden Flower', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/shirts/slimshirtshop/slim-american-pima-cotton-checked-oxford-shirt-with-mechanical-stretch/J1032?color_name=navy-mahogany', 'https://www.jcrew.com/s7-img-facade/J1029_WX2727?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Navy Mohagany', 'Red');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/sweaters/pullover/fair-isle-lambswool-crewneck-sweater/AF191?color_name=fairisle-hthr-flannel', 'https://www.jcrew.com/s7-img-facade/AF191_SU3536?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Fairisle Hthr Flannel', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/sweaters/pullover/merino-wool-jacquard-crewneck-sweater/AD407?color_name=marled-barley', 'https://www.jcrew.com/s7-img-facade/AD407_SU2853?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Marled Barley', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/sweaters/pullover/rugged-merino-wool-halfzip-sweater/J7612?color_name=hthr-maroon', 'https://www.jcrew.com/s7-img-facade/J7612_RD6489?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Hthr Maroon', 'Red');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/sweaters/pullover/rugged-merino-wool-halfzip-sweater/J7612?color_name=hthr-maroon', 'https://www.jcrew.com/s7-img-facade/J7612_GY0095?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Hthr Pewter', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/sweaters/pullover/rugged-merino-wool-halfzip-sweater/J7612?color_name=hthr-maroon', 'https://www.jcrew.com/s7-img-facade/J7612_BL8133?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Navy', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/sweaters/pullover/rugged-merino-wool-halfzip-sweater/J7612?color_name=hthr-maroon', 'https://www.jcrew.com/s7-img-facade/J7612_SU2698?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Marled Barley', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/coats_and_jackets/topcoat/ludlow-insulated-trench-coat-with-ecofriendly-primaloft/AA298?color_name=sage', 'https://www.jcrew.com/s7-img-facade/AA298_GR6223?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Sage', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/coats_and_jackets/peacoat/dock-peacoat-with-thinsulate/H0485?color_name=evergreen-heather', 'https://www.jcrew.com/s7-img-facade/H0485_WX8520?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Evergreen Heather', 'Green');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/coats_and_jackets/peacoat/dock-peacoat-with-thinsulate/H0485?color_name=evergreen-heather', 'https://www.jcrew.com/s7-img-facade/H0485_WB2192?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Navy', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/coats_and_jackets/peacoat/dock-peacoat-with-thinsulate/H0485?color_name=evergreen-heather', 'https://www.jcrew.com/s7-img-facade/H0485_GY5267?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Antique Powder', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/coats_and_jackets/topcoat/ludlow-car-coat-in-woolcashmere/AA148?color_name=light-heather-grey', 'https://www.jcrew.com/s7-img-facade/AA148_WX8041?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Light Heather Gray', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/coats_and_jackets/topcoat/ludlow-car-coat-in-woolcashmere/AA148?color_name=light-heather-grey', 'https://www.jcrew.com/s7-img-facade/AA148_WX6913?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Navy', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/coats_and_jackets/lightweight_jacket/fulton-insulated-jacket-with-ecofriendly-primaloft/AA142?color_name=midnight', 'https://www.jcrew.com/s7-img-facade/AA142_WX3265?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Midnight', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/coats_and_jackets/lightweight_jacket/fulton-insulated-jacket-with-ecofriendly-primaloft/AA142?color_name=midnight', 'https://www.jcrew.com/s7-img-facade/AA142_GY6597?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Bedford Coal', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/coats_and_jackets/lightweight_jacket/sussex-quilted-blazer-with-ecofriendly-primaloft/AC258?color_name=cadet-navy', 'https://www.jcrew.com/s7-img-facade/AC258_WX8838?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Cadet Navy', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/coats_and_jackets/lightweight_jacket/field-mechanic-jacket/B1552?color_name=olive-moss', 'https://www.jcrew.com/s7-img-facade/B1552_GR7173?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Olive Moss', 'Green');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/coats_and_jackets/lightweight_jacket/field-mechanic-jacket/B1552?color_name=olive-moss', 'https://www.jcrew.com/s7-img-facade/B1552_BL8133?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=2000&hei=2000', 'Navy', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/polos_tees/slubcotton/slub-cotton-tshirt-in-ivory-stripe/J1914?color_name=ivory', 'https://www.jcrew.com/s7-img-facade/J1914_KA3746?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Ivory', 'White');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/polos_tees/essential/crab-graphic-tshirt/J1845?color_name=deep-ultramarine-crab', 'https://www.jcrew.com/s7-img-facade/J1845_MF1307?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Deep Ultramarine Crab', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/polos_tees/novelty/rugby-crewneck-shirt-in-pieced-stripe/AD307?color_name=navy-pieced-stripe', 'https://www.jcrew.com/s7-img-facade/AD307_KA7603?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Navy Pieced Stripe', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/pants/slim/484-slimfit-pant-in-stretch-brushed-twill/AE579?color_name=salt', 'https://www.jcrew.com/s7-img-facade/AE579_WX0774?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Salt & Pepper', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/pants/slim/484-slimfit-pant-in-stretch-brushed-twill/AE579?color_name=salt', 'https://www.jcrew.com/s7-img-facade/AE579_WX0773?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'General Surplus', 'Green');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/pants/slim/484-slimfit-pant-in-stretch-brushed-twill/AE579?color_name=salt', 'https://www.jcrew.com/s7-img-facade/AE579_WX6630?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Navy Gray Donegal', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/pants/slim/484-slimfit-pant-in-stretch-brushed-twill/AE579?color_name=salt', 'https://www.jcrew.com/s7-img-facade/AE579_WX6634?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Chocolate Black Donegal', 'Brown');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/pants/slim/484-slimfit-lightweight-garmentdyed-stretch-chino/G1186?color_name=honey-brown', 'https://www.jcrew.com/s7-img-facade/G1186_BR6332?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Honey Brown', 'Brown');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/pants/slim/484-slimfit-lightweight-garmentdyed-stretch-chino/G1186?color_name=honey-brown', 'https://www.jcrew.com/s7-img-facade/G1186_GY7045?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Chrome', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/pants/slim/484-slimfit-lightweight-garmentdyed-stretch-chino/G1186?color_name=honey-brown', 'https://www.jcrew.com/s7-img-facade/G1186_WX2278?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Light Khaki', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/pants/slim/ludlow-essential-slimfit-pant-in-glen-plaid-stretch-fourseason-wool/AC140?color_name=grey-blue-black-glen', 'https://www.jcrew.com/s7-img-facade/AC140_WX6532?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Gray Blue Black Glen', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/shorts/9inchshort/9-oxford-short/K8790?color_name=light-blue-oxford', 'https://www.jcrew.com/s7-img-facade/K8790_WX3991?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Light Blue Oxford', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/shorts/9inchshort/9-oxford-short/K8790?color_name=light-blue-oxford', 'https://www.jcrew.com/s7-img-facade/K8790_WX0595?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Light Hibiscous', 'Pink');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/shorts/9inchshort/9-stretch-short/C8937?color_name=white', 'https://www.jcrew.com/s7-img-facade/C8937_WT0002?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'White', 'White');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/shorts/9inchshort/9-stretch-short/C8937?color_name=white', 'https://www.jcrew.com/s7-img-facade/C8937_BL9139?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Obsidian', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/shorts/9inchshort/9-stretch-short/C8937?color_name=white', 'https://www.jcrew.com/s7-img-facade/C8937_WX0485?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Workwear Brown', 'Brown');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/shorts/9inchshort/9-stretch-short/C8937?color_name=white', 'https://www.jcrew.com/s7-img-facade/C8937_WU7243?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Spokane Gray', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/sweaters/pullover/gemstone-sweater-in-supersoft-yarn/AF013?color_name=hthr-acorn', 'https://www.jcrew.com/s7-img-facade/AF013_BR6564?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Hthr Acorn', 'Orange');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/sweaters/pullover/gemstone-sweater-in-supersoft-yarn/AF013?color_name=hthr-acorn', 'https://www.jcrew.com/s7-img-facade/AF013_GY6762?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Hthr Dusk', 'White');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/sweaters/pullover/pointelle-cable-sweater/AF007?color_name=hthr-grey', 'https://www.jcrew.com/s7-img-facade/AF007_GY6469?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Hthr Gray', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/sweaters/pullover/pointelle-cable-sweater/AF007?color_name=hthr-grey', 'https://www.jcrew.com/s7-img-facade/AF007_GR7168?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Dried Thyme', 'Green');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/sweaters/pullover/pointelle-cable-sweater/AF007?color_name=hthr-grey', 'https://www.jcrew.com/s7-img-facade/AF007_NA6434?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Ivory', 'White');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/sweaters/pullover/pointelle-cable-sweater/AF007?color_name=hthr-grey', 'https://www.jcrew.com/s7-img-facade/AF007_PK6709?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Classic Pink', 'Pink');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/sweaters/pullover/pointelle-cable-sweater/AF007?color_name=hthr-grey', 'https://www.jcrew.com/s7-img-facade/AF007_SU2786?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Hthr Jasmine', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/sweaters/pullover/pointelle-cable-sweater/AF007?color_name=hthr-grey', 'https://www.jcrew.com/s7-img-facade/AF007_YL5461?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Rich Gold', 'Yellow');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/sweaters/pullover/tippi-sweater-in-ribbed-merino/AE498?color_name=vintage-burgundy', 'https://www.jcrew.com/s7-img-facade/AE498_RD6224?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Vintage Burgundy', 'Red');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/sweaters/pullover/tippi-sweater-in-ribbed-merino/AE498?color_name=vintage-burgundy', 'https://www.jcrew.com/s7-img-facade/AE498_BR5432?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Hthr Camel', 'Brown');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/sweaters/pullover/tippi-sweater-in-ribbed-merino/AE498?color_name=vintage-burgundy', 'https://www.jcrew.com/s7-img-facade/AE498_GR7014?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Dark Seaweed', 'Green');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/sweaters/pullover/tippi-sweater-in-ribbed-merino/AE498?color_name=vintage-burgundy', 'https://www.jcrew.com/s7-img-facade/AE498_PK5414?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Intense Pink', 'Pink');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/sweaters/pullover/tippi-sweater-in-ribbed-merino/AE498?color_name=vintage-burgundy', 'https://www.jcrew.com/s7-img-facade/AE498_RD6224?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Vintage Burgundy', 'Red');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/coats_and_jackets/woolandwoolblend/chateau-parka-in-italian-stadiumcloth-wool/J5488?color_name=sea-spray', 'https://www.jcrew.com/s7-img-facade/J5488_GR6825?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Sea Spray', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/coats_and_jackets/woolandwoolblend/chateau-parka-in-italian-stadiumcloth-wool/J5488?color_name=sea-spray', 'https://www.jcrew.com/s7-img-facade/J5488_WX6385?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Regal Blue W', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/coats_and_jackets/woolandwoolblend/chateau-parka-in-italian-stadiumcloth-wool/J5488?color_name=sea-spray', 'https://www.jcrew.com/s7-img-facade/J5488_WX9210?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Vibrant Flame W', 'Red');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/coats_and_jackets/woolandwoolblend/chateau-parka-in-italian-stadiumcloth-wool/J5488?color_name=sea-spray', 'https://www.jcrew.com/s7-img-facade/J5488_WX9211?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Hthr Gold W', 'Yellow');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/coats_and_jackets/woolandwoolblend/daphne-topcoat-in-italian-tweed/H2076?color_name=burgundy-black-jungle', 'https://www.jcrew.com/s7-img-facade/H2076_WX8495?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Burgundy Black Jungle', 'Red');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/coats_and_jackets/woolandwoolblend/daphne-topcoat-in-italian-tweed/H2076?color_name=burgundy-black-jungle', 'https://www.jcrew.com/s7-img-facade/H2076_WX8193?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Faded Guava Multi', 'Pink');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/coats_and_jackets/woolandwoolblend/daphne-topcoat-in-italian-tweed/H2076?color_name=burgundy-black-jungle', 'https://www.jcrew.com/s7-img-facade/H2076_WX8494?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Navy Black Jungle', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/coats_and_jackets/woolandwoolblend/car-coat-in-italian-doublecloth-wool/AF005?color_name=dark-curry-w', 'https://www.jcrew.com/s7-img-facade/AF005_WX9758?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Dark Curry W', 'Yellow');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/coats_and_jackets/woolandwoolblend/car-coat-in-italian-doublecloth-wool/AF005?color_name=dark-curry-w', 'https://www.jcrew.com/s7-img-facade/AF005_BL8133?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Navy', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/tshirts_tanktops/longsleevetshirts/slim-perfect-longsleeve-tshirt-in-stripes/J1638?color_name=coral-red-multi-emmet-st', 'https://www.jcrew.com/s7-img-facade/J1638_KA9629?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Coral Red Multi Emmet St', 'Red');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/tshirts_tanktops/longsleevetshirts/slim-perfect-longsleeve-tshirt-in-stripes/J1638?color_name=coral-red-multi-emmet-st', 'https://www.jcrew.com/s7-img-facade/J1638_KA4901?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Black Ivory', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/tshirts_tanktops/longsleevetshirts/slim-perfect-longsleeve-tshirt-in-stripes/J1638?color_name=coral-red-multi-emmet-st', 'https://www.jcrew.com/s7-img-facade/J1638_KA7379?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Phoebe Stripe Ivory Mult', 'Yellow');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/tshirts_tanktops/longsleevetshirts/slim-perfect-longsleeve-tshirt-in-stripes/J1638?color_name=coral-red-multi-emmet-st', 'https://www.jcrew.com/s7-img-facade/J1638_KA7478?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Gabi Stripe Ivory Multi', 'Pink');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/tshirts_tanktops/longsleevetshirts/slim-perfect-longsleeve-tshirt-in-stripes/J1638?color_name=coral-red-multi-emmet-st', 'https://www.jcrew.com/s7-img-facade/J1638_KL9484?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Navy Ivory', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/tshirts_tanktops/longsleevetshirts/tissue-turtleneck-in-floral/AC646?color_name=black-beige', 'https://www.jcrew.com/s7-img-facade/AC646_WX6484?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Black Beige', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/tshirts_tanktops/longsleevetshirts/salut-sweatshirt/AE249?color_name=iced-orchid', 'https://www.jcrew.com/s7-img-facade/AE249_PR6401?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Iced Orchid', 'Pink');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/pants/wideleg/pullon-peyton-pant-in-velvet/AB650?color_name=skylark-blue', 'https://www.jcrew.com/s7-img-facade/AB650_BL9136?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Skylark Blue', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/pants/wideleg/pullon-peyton-pant-in-velvet/AB650?color_name=skylark-blue', 'https://www.jcrew.com/s7-img-facade/AB650_PK5742?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Bright Berry', 'Pink');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/pants/wideleg/pullon-peyton-pant-in-velvet/AB650?color_name=skylark-blue', 'https://www.jcrew.com/s7-img-facade/AB650_RD5926?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Burgundy', 'Red');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/pants/wideleg/pullon-peyton-pant-in-velvet/AB650?color_name=skylark-blue', 'https://www.jcrew.com/s7-img-facade/AB650_BK0001?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Black', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/pants/slim/fulllength-cameron-pant-in-fourseason-stretch/K2089?color_name=hthr-saddle', 'https://www.jcrew.com/s7-img-facade/K2089_NA6986?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Hthr Saddle', 'Beige');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/pants/slim/fulllength-cameron-pant-in-fourseason-stretch/K2089?color_name=hthr-saddle', 'https://www.jcrew.com/s7-img-facade/K2089_GY6689?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Hthr Graphite', 'Gray');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/pants/slim/fulllength-cameron-pant-in-fourseason-stretch/K2089?color_name=hthr-saddle', 'https://www.jcrew.com/s7-img-facade/K2089_BL8133?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Navy', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/pants/slim/fulllength-cameron-pant-in-fourseason-stretch/K2089?color_name=hthr-saddle', 'https://www.jcrew.com/s7-img-facade/K2089_BK0001?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Black', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/shorts/3inch/paperbag-short-in-seersucker/L4986?color_name=white-blossom', 'https://www.jcrew.com/s7-img-facade/L4986_WX9485?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'White Blossom', 'Pink');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/shorts/3inch/paperbag-short-in-seersucker/L4986?color_name=white-blossom', 'https://www.jcrew.com/s7-img-facade/L4986_WQ6879?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Black Seersucker', 'Black');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/womens_category/shorts/3inch/paperbag-short-in-seersucker/L4986?color_name=white-blossom', 'https://www.jcrew.com/s7-img-facade/L4986_WQ6882?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Misty Peri Seersucker', 'Blue');
INSERT INTO colors (websiteURL, imageURL, color, actual) VALUES ('https://www.jcrew.com/p/mens_category/shoes_sneakers/exclusives/seavees-x-jcrew-coronado-boots/M1590?color_name=cocoa-brown', 'https://www.jcrew.com/s7-img-facade/M1590_EB5026?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850', 'Cocoa Brown', 'Brown');

INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0456032021.html', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0685814005.html', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0685814005.html', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0685814005.html', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0815456001.html', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0815456001.html', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0815456001.html', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0815456001.html', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0777504001.html', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0777504001.html', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0777504001.html', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0777504001.html', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0782880002.html', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0782880002.html', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0782880002.html', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0543548001.html', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0543548001.html', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0543548001.html', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0793018002.html', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0793018002.html', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0793018002.html', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0795334001.html', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0795334001.html', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0795334001.html', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0795334001.html', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0788172001.html', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0663382003.html', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0663382003.html', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0663382003.html', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0663382003.html', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0755629001.html', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0766112001.html', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0766112001.html', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0766112001.html', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0766112001.html', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0788301003.html', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0762169005.html', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0762169005.html', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0762169005.html', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0797618001.html', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0634744009.html', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0634744009.html', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0634744009.html', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0753481003.html', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0753481003.html', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0753481003.html', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0655502058.html', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0655502058.html', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0655502058.html', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0655502058.html', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0671777014.html', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0671777014.html', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0671777014.html', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0671777014.html', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0763731001.html', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0763731001.html', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0763731001.html', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0671777033.html', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0671777033.html', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0671777033.html', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0671777033.html', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0818166001.html', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0818166001.html', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0818166001.html', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0818166001.html', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0746168005.html', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0746168005.html', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0746168005.html', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www2.hm.com/en_us/productpage.0790006002.html', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=795219102&cid=1135879&pcid=35878&vid=1&grid=pds_11_231_1#pdp-page-content', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=795219102&cid=1135879&pcid=35878&vid=1&grid=pds_11_231_1#pdp-page-content', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=795219102&cid=1135879&pcid=35878&vid=1&grid=pds_11_231_1#pdp-page-content', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=795219102&cid=1135879&pcid=35878&vid=1&grid=pds_11_231_1#pdp-page-content', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=512308012&cid=1144781&pcid=44873&vid=1&grid=pds_0_356_1#pdp-page-content', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=512308012&cid=1144781&pcid=44873&vid=1&grid=pds_0_356_1#pdp-page-content', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=512308012&cid=1144781&pcid=44873&vid=1&grid=pds_0_356_1#pdp-page-content', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=512342002&cid=1144781&pcid=44873&vid=1&grid=pds_18_356_1#pdp-page-content', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=512342002&cid=1144781&pcid=44873&vid=1&grid=pds_18_356_1#pdp-page-content', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=512342002&cid=1144781&pcid=44873&vid=1&grid=pds_18_356_1#pdp-page-content', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=488759012&cid=1144197&pcid=1072457&vid=1&grid=pds_9_63_1#pdp-page-content', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=488759012&cid=1144197&pcid=1072457&vid=1&grid=pds_9_63_1#pdp-page-content', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=488759012&cid=1144197&pcid=1072457&vid=1&grid=pds_9_63_1#pdp-page-content', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=488759012&cid=1144197&pcid=1072457&vid=1&grid=pds_9_63_1#pdp-page-content', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=490578002&cid=1119446&pcid=28660&vid=1&grid=pds_8_409_1#pdp-page-content', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=490578002&cid=1119446&pcid=28660&vid=1&grid=pds_8_409_1#pdp-page-content', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=490578002&cid=1119446&pcid=28660&vid=1&grid=pds_8_409_1#pdp-page-content', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=493415002&cid=1107754&pcid=5022&vid=1&grid=pds_8_73_1#pdp-page-content', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=491430002&cid=1119446&pcid=28660&vid=1&grid=pds_39_409_1#pdp-page-content', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=491430002&cid=1119446&pcid=28660&vid=1&grid=pds_39_409_1#pdp-page-content', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=491430002&cid=1119446&pcid=28660&vid=1&grid=pds_39_409_1#pdp-page-content', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=493425002&cid=1144359&pcid=67595&vid=1&grid=pds_12_233_1#pdp-page-content', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=493425002&cid=1144359&pcid=67595&vid=1&grid=pds_12_233_1#pdp-page-content', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=493425002&cid=1144359&pcid=67595&vid=1&grid=pds_12_233_1#pdp-page-content', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=493425002&cid=1144359&pcid=67595&vid=1&grid=pds_12_233_1#pdp-page-content', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=490584012&cid=1119446&pcid=28660&vid=1&grid=pds_30_409_1#pdp-page-content', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=490584012&cid=1119446&pcid=28660&vid=1&grid=pds_30_409_1#pdp-page-content', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=490584012&cid=1119446&pcid=28660&vid=1&grid=pds_30_409_1#pdp-page-content', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=266946002&cid=1032802&pcid=1032801&vid=1&grid=pds_9_59_1#pdp-page-content', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=266946002&cid=1032802&pcid=1032801&vid=1&grid=pds_9_59_1#pdp-page-content', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=266946002&cid=1032802&pcid=1032801&vid=1&grid=pds_9_59_1#pdp-page-content', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=266946002&cid=1032802&pcid=1032801&vid=1&grid=pds_9_59_1#pdp-page-content', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=491424002&cid=1140928&pcid=1016720&vid=1&grid=pds_5_77_1#pdp-page-content', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=491424002&cid=1140928&pcid=1016720&vid=1&grid=pds_5_77_1#pdp-page-content', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=491424002&cid=1140928&pcid=1016720&vid=1&grid=pds_5_77_1#pdp-page-content', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=457734002&cid=29096&pcid=29818&vid=1&grid=pds_5_498_1#pdp-page-content', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=457734002&cid=29096&pcid=29818&vid=1&grid=pds_5_498_1#pdp-page-content', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=457734002&cid=29096&pcid=29818&vid=1&grid=pds_5_498_1#pdp-page-content', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=457734002&cid=29096&pcid=29818&vid=1&grid=pds_5_498_1#pdp-page-content', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=491462002&cid=1140928&pcid=1016720&vid=1&grid=pds_7_77_1#pdp-page-content', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=491462002&cid=1140928&pcid=1016720&vid=1&grid=pds_7_77_1#pdp-page-content', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=491462002&cid=1140928&pcid=1016720&vid=1&grid=pds_7_77_1#pdp-page-content', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=491360012&cid=1140928&pcid=1016720&vid=1&grid=pds_11_77_1#pdp-page-content', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=491360012&cid=1140928&pcid=1016720&vid=1&grid=pds_11_77_1#pdp-page-content', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=491360012&cid=1140928&pcid=1016720&vid=1&grid=pds_11_77_1#pdp-page-content', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=473501012&cid=1140927&pcid=1016720&vid=1&grid=pds_28_77_1#pdp-page-content', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=424369022&cid=1117376&pcid=1020051&vid=1&grid=pds_59_62_1#pdp-page-content', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=510240002&cid=1140927&pcid=1016720&vid=1&grid=pds_40_77_1#pdp-page-content', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=517410012&cid=1092423&pcid=1071875&vid=1&grid=pds_27_72_1#pdp-page-content', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=517410012&cid=1092423&pcid=1071875&vid=1&grid=pds_27_72_1#pdp-page-content', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=472580022&cid=5037&pcid=5037&vid=1&grid=pds_17_287_1&cpos=17&cexp=1350&cid=CategoryIDs%3D5037&cvar=9779&ctype=Listing&cpid=res19102322163383204100366#pdp-page-content', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=472580022&cid=5037&pcid=5037&vid=1&grid=pds_17_287_1&cpos=17&cexp=1350&cid=CategoryIDs%3D5037&cvar=9779&ctype=Listing&cpid=res19102322163383204100366#pdp-page-content', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=472580022&cid=5037&pcid=5037&vid=1&grid=pds_17_287_1&cpos=17&cexp=1350&cid=CategoryIDs%3D5037&cvar=9779&ctype=Listing&cpid=res19102322163383204100366#pdp-page-content', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=472580022&cid=5037&pcid=5037&vid=1&grid=pds_17_287_1&cpos=17&cexp=1350&cid=CategoryIDs%3D5037&cvar=9779&ctype=Listing&cpid=res19102322163383204100366#pdp-page-content', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=510478012&cid=5037&pcid=5037&vid=1&grid=pds_9_287_1&cpos=9&cexp=1350&cid=CategoryIDs%3D5037&cvar=9779&ctype=Listing&cpid=res19102322282732381617060#pdp-page-content', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=510478012&cid=5037&pcid=5037&vid=1&grid=pds_9_287_1&cpos=9&cexp=1350&cid=CategoryIDs%3D5037&cvar=9779&ctype=Listing&cpid=res19102322282732381617060#pdp-page-content', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=510478012&cid=5037&pcid=5037&vid=1&grid=pds_9_287_1&cpos=9&cexp=1350&cid=CategoryIDs%3D5037&cvar=9779&ctype=Listing&cpid=res19102322282732381617060#pdp-page-content', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=510478012&cid=5037&pcid=5037&vid=1&grid=pds_9_287_1&cpos=9&cexp=1350&cid=CategoryIDs%3D5037&cvar=9779&ctype=Listing&cpid=res19102322282732381617060#pdp-page-content', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=518512002&cid=1091938&pcid=99915&vid=1&grid=pds_5_125_1#pdp-page-content', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=518512002&cid=1091938&pcid=99915&vid=1&grid=pds_5_125_1#pdp-page-content', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=425037022&cid=99915&pcid=99915&vid=1&grid=pds_14_111_1&cpos=14&cexp=1350&cid=CategoryIDs%3D99915&cvar=9779&ctype=Listing&cpid=res19102322757915270402056#pdp-page-content', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=425037022&cid=99915&pcid=99915&vid=1&grid=pds_14_111_1&cpos=14&cexp=1350&cid=CategoryIDs%3D99915&cvar=9779&ctype=Listing&cpid=res19102322757915270402056#pdp-page-content', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=425037022&cid=99915&pcid=99915&vid=1&grid=pds_14_111_1&cpos=14&cexp=1350&cid=CategoryIDs%3D99915&cvar=9779&ctype=Listing&cpid=res19102322757915270402056#pdp-page-content', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://bananarepublic.gap.com/browse/product.do?pid=487709012&cid=99915&pcid=99915&vid=1&grid=pds_35_111_1&cpos=36&cexp=1350&cid=CategoryIDs%3D99915&cvar=9779&ctype=Listing&cpid=res19102322482025365569640#pdp-page-content', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/wvawa-h30081?variant=29215078809699', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/codcs-h26852?variant=29215125307491', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/codcs-h26852?variant=29215125307491', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/codcs-h26852?variant=29215125307491', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/codcs-h26852?variant=29215125307491', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/new-england-raincoat-psadj-h01321?variant=19472242278456', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/t-shirt-ollie?variant=19438704754744', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/t-shirt-ollie?variant=19438704754744', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/t-shirt-ollie?variant=19438704754744', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/t-shirt-ollie?variant=19438704754744', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/chris-shorts-codad-h10128?variant=19472259350584', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/rene-shorts-codbd-h10127?variant=19472238870584', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/t-shirt-vpc-h?variant=19438400045112', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/t-shirt-vpc-h?variant=19438400045112', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/t-shirt-vpc-h?variant=19438400045112', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/t-shirt-vpc-h?variant=19438400045112', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/logo-t-shirt-codat-f26782?variant=28401707843683', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/logo-t-shirt-codat-f26782?variant=28401707843683', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/logo-t-shirt-codat-f26782?variant=28401707843683', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/logo-t-shirt-codat-f26782?variant=28401707843683', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/codbr-h02574?variant=29215139037283', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/codbr-h02574?variant=29215139037283', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/codbr-h02574?variant=29215139037283', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/woajw-h02475?variant=29215080382563', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/woajw-h02475?variant=29215080382563', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/woajw-h02475?variant=29215080382563', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/cyd-t-shirt-codau-f26590?variant=19472259186744', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/cyd-t-shirt-codau-f26590?variant=19472259186744', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/cyd-t-shirt-codau-f26590?variant=19472259186744', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/cyd-t-shirt-codau-f26590?variant=19472259186744', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/puaan-h56048?variant=29215223709795', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/puaan-h56048?variant=29215223709795', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/puaan-h56048?variant=29215223709795', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/puaan-h56048?variant=29215223709795', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/codeq-h27557?variant=29710698479715', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/codeq-h27557?variant=29710698479715', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/codeq-h27557?variant=29710698479715', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/boots-stanislas?variant=19438587707448', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/boots-stanislas?variant=19438587707448', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/boots-stanislas?variant=19438587707448', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/boots-stanislas?variant=19438587707448', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/logo-sweatshirt-coday-h27518?variant=19472244604984', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/logo-sweatshirt-coday-h27518?variant=19472244604984', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/logo-sweatshirt-coday-h27518?variant=19472244604984', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/minimal-femme-1?variant=19438497792056', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/minimal-femme-1?variant=19438497792056', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/minimal-femme-1?variant=19438497792056', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/minimal-femme-1?variant=19438497792056', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/woake-f01398?variant=29215079268451', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/roma-shorts-codab-f10055?variant=19472238706744', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/jupe-shanya-3?variant=19466469277752', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.apc-us.com/products/woakk-f06292?variant=29722233634915', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/shirts/slimshirtshop/slim-stretch-secret-wash-shirt-in-spring-floral-organic-cotton/AC021?color_name=springiscoming-navy', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/shirts/slimshirtshop/slim-stretch-secret-wash-shirt-in-spring-floral-organic-cotton/AC021?color_name=springiscoming-navy', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/shirts/slimshirtshop/slim-stretch-secret-wash-shirt-in-spring-floral-organic-cotton/AC021?color_name=springiscoming-navy', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/shirts/slimshirtshop/slim-stretch-secret-wash-shirt-in-botanic-print-organic-cotton/AG447?color_name=botanic-garden-flower', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/shirts/slimshirtshop/slim-stretch-secret-wash-shirt-in-botanic-print-organic-cotton/AG447?color_name=botanic-garden-flower', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/shirts/slimshirtshop/slim-stretch-secret-wash-shirt-in-botanic-print-organic-cotton/AG447?color_name=botanic-garden-flower', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/shirts/slimshirtshop/slim-american-pima-cotton-checked-oxford-shirt-with-mechanical-stretch/J1032?color_name=navy-mahogany', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/shirts/slimshirtshop/slim-american-pima-cotton-checked-oxford-shirt-with-mechanical-stretch/J1032?color_name=navy-mahogany', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/shirts/slimshirtshop/slim-american-pima-cotton-checked-oxford-shirt-with-mechanical-stretch/J1032?color_name=navy-mahogany', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/sweaters/pullover/fair-isle-lambswool-crewneck-sweater/AF191?color_name=fairisle-hthr-flannel', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/sweaters/pullover/fair-isle-lambswool-crewneck-sweater/AF191?color_name=fairisle-hthr-flannel', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/sweaters/pullover/fair-isle-lambswool-crewneck-sweater/AF191?color_name=fairisle-hthr-flannel', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/sweaters/pullover/merino-wool-jacquard-crewneck-sweater/AD407?color_name=marled-barley', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/sweaters/pullover/merino-wool-jacquard-crewneck-sweater/AD407?color_name=marled-barley', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/sweaters/pullover/merino-wool-jacquard-crewneck-sweater/AD407?color_name=marled-barley', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/sweaters/pullover/rugged-merino-wool-halfzip-sweater/J7612?color_name=hthr-maroon', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/sweaters/pullover/rugged-merino-wool-halfzip-sweater/J7612?color_name=hthr-maroon', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/sweaters/pullover/rugged-merino-wool-halfzip-sweater/J7612?color_name=hthr-maroon', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/coats_and_jackets/topcoat/ludlow-insulated-trench-coat-with-ecofriendly-primaloft/AA298?color_name=sage', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/coats_and_jackets/peacoat/dock-peacoat-with-thinsulate/H0485?color_name=evergreen-heather', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/coats_and_jackets/topcoat/ludlow-car-coat-in-woolcashmere/AA148?color_name=light-heather-grey', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/coats_and_jackets/lightweight_jacket/fulton-insulated-jacket-with-ecofriendly-primaloft/AA142?color_name=midnight', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/coats_and_jackets/lightweight_jacket/fulton-insulated-jacket-with-ecofriendly-primaloft/AA142?color_name=midnight', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/coats_and_jackets/lightweight_jacket/fulton-insulated-jacket-with-ecofriendly-primaloft/AA142?color_name=midnight', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/coats_and_jackets/lightweight_jacket/sussex-quilted-blazer-with-ecofriendly-primaloft/AC258?color_name=cadet-navy', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/coats_and_jackets/lightweight_jacket/sussex-quilted-blazer-with-ecofriendly-primaloft/AC258?color_name=cadet-navy', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/coats_and_jackets/lightweight_jacket/sussex-quilted-blazer-with-ecofriendly-primaloft/AC258?color_name=cadet-navy', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/coats_and_jackets/lightweight_jacket/field-mechanic-jacket/B1552?color_name=olive-moss', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/coats_and_jackets/lightweight_jacket/field-mechanic-jacket/B1552?color_name=olive-moss', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/coats_and_jackets/lightweight_jacket/field-mechanic-jacket/B1552?color_name=olive-moss', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/polos_tees/slubcotton/slub-cotton-tshirt-in-ivory-stripe/J1914?color_name=ivory', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/polos_tees/slubcotton/slub-cotton-tshirt-in-ivory-stripe/J1914?color_name=ivory', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/polos_tees/slubcotton/slub-cotton-tshirt-in-ivory-stripe/J1914?color_name=ivory', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/polos_tees/slubcotton/slub-cotton-tshirt-in-ivory-stripe/J1914?color_name=ivory', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/polos_tees/essential/crab-graphic-tshirt/J1845?color_name=deep-ultramarine-crab', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/polos_tees/essential/crab-graphic-tshirt/J1845?color_name=deep-ultramarine-crab', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/polos_tees/essential/crab-graphic-tshirt/J1845?color_name=deep-ultramarine-crab', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/polos_tees/essential/crab-graphic-tshirt/J1845?color_name=deep-ultramarine-crab', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/polos_tees/novelty/rugby-crewneck-shirt-in-pieced-stripe/AD307?color_name=navy-pieced-stripe', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/polos_tees/novelty/rugby-crewneck-shirt-in-pieced-stripe/AD307?color_name=navy-pieced-stripe', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/polos_tees/novelty/rugby-crewneck-shirt-in-pieced-stripe/AD307?color_name=navy-pieced-stripe', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/pants/slim/484-slimfit-pant-in-stretch-brushed-twill/AE579?color_name=salt', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/pants/slim/484-slimfit-pant-in-stretch-brushed-twill/AE579?color_name=salt', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/pants/slim/484-slimfit-pant-in-stretch-brushed-twill/AE579?color_name=salt', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/pants/slim/484-slimfit-pant-in-stretch-brushed-twill/AE579?color_name=salt', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/pants/slim/484-slimfit-lightweight-garmentdyed-stretch-chino/G1186?color_name=honey-brown', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/pants/slim/484-slimfit-lightweight-garmentdyed-stretch-chino/G1186?color_name=honey-brown', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/pants/slim/484-slimfit-lightweight-garmentdyed-stretch-chino/G1186?color_name=honey-brown', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/pants/slim/484-slimfit-lightweight-garmentdyed-stretch-chino/G1186?color_name=honey-brown', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/pants/slim/ludlow-essential-slimfit-pant-in-glen-plaid-stretch-fourseason-wool/AC140?color_name=grey-blue-black-glen', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/pants/slim/ludlow-essential-slimfit-pant-in-glen-plaid-stretch-fourseason-wool/AC140?color_name=grey-blue-black-glen', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/pants/slim/ludlow-essential-slimfit-pant-in-glen-plaid-stretch-fourseason-wool/AC140?color_name=grey-blue-black-glen', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/pants/slim/ludlow-essential-slimfit-pant-in-glen-plaid-stretch-fourseason-wool/AC140?color_name=grey-blue-black-glen', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/shorts/9inchshort/9-oxford-short/K8790?color_name=light-blue-oxford', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/shorts/9inchshort/9-stretch-short/C8937?color_name=white', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/sweaters/pullover/gemstone-sweater-in-supersoft-yarn/AF013?color_name=hthr-acorn', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/sweaters/pullover/gemstone-sweater-in-supersoft-yarn/AF013?color_name=hthr-acorn', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/sweaters/pullover/gemstone-sweater-in-supersoft-yarn/AF013?color_name=hthr-acorn', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/sweaters/pullover/pointelle-cable-sweater/AF007?color_name=hthr-grey', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/sweaters/pullover/pointelle-cable-sweater/AF007?color_name=hthr-grey', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/sweaters/pullover/pointelle-cable-sweater/AF007?color_name=hthr-grey', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/sweaters/pullover/tippi-sweater-in-ribbed-merino/AE498?color_name=vintage-burgundy', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/sweaters/pullover/tippi-sweater-in-ribbed-merino/AE498?color_name=vintage-burgundy', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/sweaters/pullover/tippi-sweater-in-ribbed-merino/AE498?color_name=vintage-burgundy', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/coats_and_jackets/woolandwoolblend/chateau-parka-in-italian-stadiumcloth-wool/J5488?color_name=sea-spray', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/coats_and_jackets/woolandwoolblend/daphne-topcoat-in-italian-tweed/H2076?color_name=burgundy-black-jungle', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/coats_and_jackets/woolandwoolblend/car-coat-in-italian-doublecloth-wool/AF005?color_name=dark-curry-w', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/tshirts_tanktops/longsleevetshirts/slim-perfect-longsleeve-tshirt-in-stripes/J1638?color_name=coral-red-multi-emmet-st', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/tshirts_tanktops/longsleevetshirts/slim-perfect-longsleeve-tshirt-in-stripes/J1638?color_name=coral-red-multi-emmet-st', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/tshirts_tanktops/longsleevetshirts/slim-perfect-longsleeve-tshirt-in-stripes/J1638?color_name=coral-red-multi-emmet-st', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/tshirts_tanktops/longsleevetshirts/tissue-turtleneck-in-floral/AC646?color_name=black-beige', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/tshirts_tanktops/longsleevetshirts/tissue-turtleneck-in-floral/AC646?color_name=black-beige', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/tshirts_tanktops/longsleevetshirts/tissue-turtleneck-in-floral/AC646?color_name=black-beige', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/tshirts_tanktops/longsleevetshirts/salut-sweatshirt/AE249?color_name=iced-orchid', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/tshirts_tanktops/longsleevetshirts/salut-sweatshirt/AE249?color_name=iced-orchid', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/tshirts_tanktops/longsleevetshirts/salut-sweatshirt/AE249?color_name=iced-orchid', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/pants/wideleg/pullon-peyton-pant-in-velvet/AB650?color_name=skylark-blue', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/pants/wideleg/pullon-peyton-pant-in-velvet/AB650?color_name=skylark-blue', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/pants/wideleg/pullon-peyton-pant-in-velvet/AB650?color_name=skylark-blue', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/pants/wideleg/pullon-peyton-pant-in-velvet/AB650?color_name=skylark-blue', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/pants/slim/fulllength-cameron-pant-in-fourseason-stretch/K2089?color_name=hthr-saddle', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/pants/slim/fulllength-cameron-pant-in-fourseason-stretch/K2089?color_name=hthr-saddle', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/pants/slim/fulllength-cameron-pant-in-fourseason-stretch/K2089?color_name=hthr-saddle', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/pants/slim/fulllength-cameron-pant-in-fourseason-stretch/K2089?color_name=hthr-saddle', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/womens_category/shorts/3inch/paperbag-short-in-seersucker/L4986?color_name=white-blossom', 'Summer');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/shoes_sneakers/exclusives/seavees-x-jcrew-coronado-boots/M1590?color_name=cocoa-brown', 'Fall');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/shoes_sneakers/exclusives/seavees-x-jcrew-coronado-boots/M1590?color_name=cocoa-brown', 'Spring');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/shoes_sneakers/exclusives/seavees-x-jcrew-coronado-boots/M1590?color_name=cocoa-brown', 'Winter');
INSERT INTO seasons (websiteURL, season) VALUES ('https://www.jcrew.com/p/mens_category/shoes_sneakers/exclusives/seavees-x-jcrew-coronado-boots/M1590?color_name=cocoa-brown', 'Summer');
