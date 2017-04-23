# README

Online Book Catalogue application allows users to browse through existing books. Registered user is able to view, add, edit and delete a book; while not registered user is only able to view existing books.

We used Ruby on rails framework for developing the application. We used Devise for authentication. 


When you start the application, the home page will be the list of existing books, if the database is not empty. 

In order to add books, you have to register and log in. After that, you are going to see on nav menu 'Add new book' link. When you click, you have to fill all fields (all fileds are required). Notice that, ISBN is unique and there is a special format for it (the input filed is masked). Also, in order to successfully add the book, you have to have authors in the database. Go to link 'Add new author' and add new. 

***Note: 'It was required for me to create Book table, which is going to have author as a column. But I decided to seperate the table into two tables: Book table and Author table; and because of many-to-many relation, we have one more table.'

If you want to view book details, just click on the book.
You are able also to edit and delete the book.
