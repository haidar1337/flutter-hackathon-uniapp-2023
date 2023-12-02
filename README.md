# KFUPM Student App


<img src="https://cdn6.aptoide.com/imgs/a/4/b/a4b374fa696f63838c2ade2b1fe74368_icon.png"/>

## Description

The KFUPM Student app, designed for the students of King Fahd University of Petroleum and Minerals (KFUPM), offers various features to help manage daily academic activities:


## Getting Started

### Dependencies

* You need to have Flutter installed in your machine along with Xcode or Android Studio to run the application on a mobile device.


### Installing

* Start by cloning this project using:
```
git clone https://github.com/Rushchu/flutterweekend_awladnh_2023
```
* Then, open the project in your favorite code editor. VS Code Recommended.

### Executing Program

* Launch your emulator either Android or iOS device.
* Run the app using:
```
flutter run
```

## Help

If for some reason the app contains errors, try running: 
```
flutter pub get
```
If the errors are still there, please contact us.

## Requirements Description

As a student, I shall be able to login into my university account, view my profile details such as, my class standing, and my university id. When my professors take the attendance by showing the QR code in the class's screen, I must be able to use the application's scanner to scan the QR code to mark my attendance. When the final exams schedule is finalized by the registrar, I should be able to view my courses' final exams schedule and it must indicate the date, time, and location. Also, I must be able to access study tools & resources offered by the university and/or professors. Study tools include and not limited to: previous examinations, flashcards, community help, etc. The app should automatically post any events and announcemnts. For example: webinars, contests, official university announcements, and more. I also shall recieve any important updates like exams dates, and events announcements. The app shall provide me with an academic calendar that views every upcoming events and official vacation days, and I should be able to add new events to a certain date, like assignemnt due date. I shall be able to see my class schedule indicating the time, location, course name, days of the week where I have a class. At the end of the semester, I should be able to evaluate my instructors using the university's criteria to improve the future teaching experience and provide feedback. For my ease, I shall be able to access my housing contract and english/arabic identification letters as well as honor letters through the app. Additionally, I need to review my past semesters grades showing my GPA and my grade in each course that I have taken during that semester. Finally, I should be able to access help and report issues through the app, and access the most frequently asked questions (FAQ) throught the app.

## Use Case Diagram

![image](https://github.com/Rushchu/flutterweekend_awladnh_2023/assets/72689865/9788e193-30ac-4500-afa6-6c6eaf3aa488)

## Structure & Architecture

We implemented an unstrict clean architecture (i.e. no domain and no services layer) with presentation layer and data layer. The reason behind that is that we are a team of 5 and we wanted to support multiple simultaneous independent work across the team where each member can implement his own associated feature. In addition, we are seperating the concern of the UI and the logic code supporting seperation of concerns and scalability for future maintenance scenarios as well as adding new features.

## Frontend

Obviously using [flutter](https://github.com/flutter/flutter) API to write our frontend code. Frontend is written inside the presentation layer of each feature to seperate the UI code from the data code. Commonly used widgets across the application are written under a common file called commonn_widgets to easily access the most used widgets and without rewriting them from scratch. We used [riverpod](https://github.com/rrousselGit/riverpod) for state management to suppport better performance and get rid of unnecessary rebuilds especially huge widgets rebuild.

## Backend

We used [firebase](https://firebase.google.com/) to implement our backend code inside the data layer of each feature. We used Firebase Authentication to implement the authentication by creating an authentication repository that communicates with the login screen. Other backened data are synthetic as we cannot access students data for security reasons. 

## Authors

Contributors names and contact info

* Haidar Abugurain [@Rushchu](https://github.com/Rushchu)
* Ali Al-Hubail [@Alimoh744](https://github.com/Alimoh744)
* Jaafar Al-Mualim [@Jaafar Al-Muallim](https://github.com/JaafarAlMuallim)
* Ahmad Almakhlooq [@Ahmed Talal Al-Makhlooq](https://github.com/Ahmed-T-A)
* Ridah Almoslem [@Ridah Al Moslem](https://github.com/Ridah-AlMoslem)

## Version History

* 0.1
Initial application



