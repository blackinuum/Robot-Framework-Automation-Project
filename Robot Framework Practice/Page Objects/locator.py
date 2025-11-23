#Instead of using directly an element like this : //*[@id='submit'] each time we want to test it
#We assign a locator to a variable in this file, and just like that if the id for example  changes we wont have to hunt it
#through all the script and change it we can simply change it from here.
username_field="name:username"
password_field="name:password"
login_btn="//*[@id='submit']"