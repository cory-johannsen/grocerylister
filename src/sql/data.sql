
--
-- Data for Name: grocery_list; Type: TABLE DATA; Schema: public; Owner: grocerylister
--

COPY grocery_list (id, name, last_modified) FROM stdin WITH DELIMITER ',';
1,Fred Meyer,2016-06-15 08:10:41.094561
2,Fred Meyer,2016-06-14 08:10:41.094561
3,Trader Joe's,2016-05-25 08:10:41.094561
\.


--
-- Name: grocery_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grocerylister
--

SELECT pg_catalog.setval(''grocery_list_id_seq'', 3, true);

--
-- Data for Name: store; Type: TABLE DATA; Schema: public; Owner: grocerylister
--

COPY store (id, name, grocery_list_id) FROM stdin WITH DELIMITER ',';
1,Fred Meyer on Hawthorne,1
2,Fred Meyer on 82nd,2
3,Trader Joe''s,3
\.

--
-- Name: store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grocerylister
--

SELECT pg_catalog.setval('store_id_seq', 3, true);


--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: grocerylister
--

COPY department (id, name) FROM stdin WITH DELIMITER ',';
1,Floral
2,Produce
3,Organic_Foods
4,Organic_Cleaning_Supplies
5,Bulk_Food
6,Bread
7,Baking
8,Cereal
9,Pet_Supplies
10,Cleaning_Supplies
11,Paper_Products
12,Condiments
13,Soup
14,Canned_Meat
15,Canned_Vegetables
16,Drinks
17,Cookies
18,Crackers
19,Frozen
20,Meat
21,Dairy
22,Health
\.


SELECT pg_catalog.setval(''department_id_seq'', 22, true);

--
-- Data for Name: store_department; Type: TABLE DATA; Schema: public; Owner: grocerylister
--

COPY store_department (store_id, department_id, index) FROM stdin WITH DELIMITER ',';
1,1,0
1,2,1
1,3,2
1,4,3
1,5,4
1,6,5
1,7,6
1,8,7
1,9,8
1,10,9
1,11,10
1,12,11
1,13,12
1,14,13
1,15,14
1,16,15
1,17,16
1,18,17
1,19,18
1,20,19
1,21,20
1,22,21
2,1,0
2,6,1
2,2,2
2,21,3
2,16,4
2,17,5
2,18,6
2,19,7
2,8,8
2,9,9
2,10,10
2,11,11
2,12,12
2,13,13
2,19,14
2,20,15
\.



--
-- Data for Name: grocery_list_product; Type: TABLE DATA; Schema: public; Owner: grocerylister
--

COPY grocery_list_product (grocery_list_id, product_id) FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: grocerylister
--

COPY product (id, department_id, name) FROM stdin WITH DELIMITER ',';
1,2,Carrots
2,2,Pineapple
3,2,Mango
4,2,Salad
5,2,Tomatoes
6,2,Avocado
7,2,Potatoes
8,2,Strawberries
9,2,Raspberries
10,2,Blueberries
11,2,Nectarines
12,2,Peaches
13,6,Whole Wheat Bread
14,6,English Muffins
15,6,Bagels - Plain
16,6,Bagels - Cinnamon Raisin
17,7,Sugar
18,7,Flour
19,7,Brown Sugar
20,7,Powdered Sugar
21,7,PAM
22,7,Cake Mix - Yellow
23,7,Cake Mix - White
24,7,Cake Mix - Chocolate
25,3,Amy's Refried Black Beans
26,3,Amy's Refried Beans with Green Chiles
27,8,Honey Nut Cheerios
28,8,Oatmeal
29,8,Instant Oatmeal - Blueberry
30,8,Instant Oatmeal - Apple Cinnamon
31,8,Instant Oatmeal - Cranberry Almond
32,8,Instant Oatmeal - Cranberry and Blueberry
33,8,Cream of Wheat
34,8,Grits
35,9,Poop Bags
36,10,Dawn dish detergent
37,10,Dishwasher packs
38,10,Chlorox kitchen cleaner
39,10,Toilet bowl cleaner
40,10,Green scrubbies
41,10,Garbage bags
42,11,Paper Towels - Bounty
43,11,Toilet Paper
44,11,Kleenex
45,12,Ketchup
46,12,Mustard
47,12,BBQ Sauce
48,12,Dill pickles - small whole
49,12,Dill pickles - spears
50,12,Dill relish
51,12,Sweet pickles
52,12,Sweet relish
53,12,Mustard relish
54,12,Soy sauce
55,13,Tomato Bisque
56,13,Chicken Broth
57,13,Vegetable Broth
58,13,Beef Broth
59,14,Tuna
60,15,Corn
61,15,Sweet Peas
62,15,Green beans
63,16,Kool-Aid Drink Drops
64,16,Diet Root beer
65,17,Milano
66,18,Club
67,18,Ritz
68,18,Saltines
69,18,Oyster crackers
70,18,Chex Mix
71,19,Ice cream
72,19,Fruit
73,19,Hash browns
74,19,Fries
75,20,Steak
76,20,Ribs
77,20,Chicken
78,20,Turkey
79,20,Bacon
80,20,Sausage
81,21,Butter - Stick
82,21,Butter - Tub
83,21,Cheese
84,21,Milk
85,21,Cream Cheese
86,22,Zyrtec
87,22,Toothpaste
88,22,Floss
89,22,Fiber gummies
90,22,Miralax
91,22,Aveeno Lavender Baby Lotion
\.


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grocerylister
--

SELECT pg_catalog.setval('product_id_seq', 91, true);