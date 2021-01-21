# Ecommerce App

Flutter App using REST API, Firebase, Device Image Gallery, Forms and Validations.

![](screenshots/product-add-page.jpg)
![](screenshots/product-list.jpg)
![](screenshots/login-page.jpg)
![](screenshots/register-page.jpg)

Run in your terminal:
```
flutter packages get
flutter run
```

Firebase
```
{
  /* Visit https://firebase.google.com/docs/database/security to learn more about security rules. */
  "rules": {
    ".read": "auth != null",
    ".write": "auth != null"
  }
}
```
