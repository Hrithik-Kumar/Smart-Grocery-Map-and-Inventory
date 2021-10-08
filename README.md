# Smart Grocery Map and Inventory
## Motivation and Project Description
- In large stores, people often lack a convenient way to find all their goods. Without guidance around the place, shoppers always have to traverse the entire store just to find a small item. Most stores like Walmart or IKEA don't have a detailed map labeling every item or section. With this information missing, it could waste a lot of people's time when they search for multiple items at once. 
- Our platform will help generate an optimal map based on a shopper's e-cart or grocery list that maps out the shortest path to get all their goods.
- Team boundarybreakers will contribute its skills to create a mobile application that addresses the issue mentioned above.
## Installation
Frontend
- [Download Flutter and setup your device](https://flutter.dev/docs/get-started/install)
- cd into the smart_grocery_map directory and get the sqflite plugin
```sh
$ cd smart_grocery_map
$ flutter pub get
```
- run the app
```sh
$ flutter run -d chrome --web-port=3001 lib/main.dart
```
Technologies we use include: 
1. [Flutter](https://flutter.dev/docs/get-started/install)
2. sqflite: a Flutter plugin for SQLite
3. [Java](https://www.java.com/en/download/manual.jsp)

Backend: To run the Django which connects to the SQLite database:
- Have Python installed.
- Install Django and Pillow
```sh
$ python -m pip install Django
$ python -m pip install Pillow
```
- cd into backend and start the server
```sh
$ cd code/backend
$ python manage.py runserver
```
## Contribution
### Do you use Git Flow? 
Yes, we will use the Git Flow model that uses multiple feature and main branches. 
### What do you name your branches? 
- main branch: containing the current working version
- develop branch: containing the current developing code that will be merged into the main branch
- feature-Name branches: containing newly made features branching off the develop branch. 
### Do you use github issues or another ticketing website? 
Github Issues, Discord, and Jira will be used to ticket issues.
### Do you use pull requests? 
Yes, process described below: 
1. Clone repository from this site and create a new branch.
```sh
git checkout https://github.com/UTSCCSCC01/projectf21-team-boundarybreakers -b name_for_new_branch
```
2. Change existing functions or add new features.
3. Test thoroughly.
4. Submit pull request with a detailed description of changes made. 
