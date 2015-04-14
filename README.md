# tablefootball

Tested on: Ubuntu 14.04.1, mysql 5.5.41, Django version 1.7, Apache2 2.4.7

Follow the instructions here to set up a django test environment:

https://docs.djangoproject.com/en/1.7/intro/tutorial01/

You need to define the file /etc/my.cnf, which takes the following form:

```
[client]
database = tablefootball
user = XXXX
password = XXXX
default-character-set = utf8
```

Once the database is communicating with django, the following command will set up all of the tables:

    python manage.py migrate

and then you can run the following to kick off a test server (presuming you have all the prerequisites installed)

    python manage.py runserver
    
access the test server at:
    http://localhost:8000
