Description -
Do things using a computer in addition to your Hubitat hub. 
Control your computer and Hubitat using a remote, Hubitat app, Alexa, a timer etc.

Since Alexa can communicate with Hubitat using the Hubitat skill,  Alexa can control the computer thru Hubitat.
For example saying Alexa show me the weather will open the MyRadar app on the PC. 
Note: this is different than simple controlling the computer with a remote control see  1 - Control your PC with a remote

Types of computer control -
1 - Control PC with a remote

2 - Control smart devices with a remote and a computer

3 - Control PC with voice or smart phone (Hubitat app)

4 - Control PC with Timed actions

References -
VBS stuff
Hubitat - Maker API
Hubitat - Lighting control with Maker API
Write a new row to a Google sheet
Smart home action timer
Smart home dashboard and utilities
Computer - github
Understand restart the loops
Using remote modes


How does it work -
The computer is waiting for something to change in Hubitat 
When the change occurs Then the computer does something

Looks like I have multiple Subjects one observer (see below)

The computer communicates with Hubitat using the Maker API
In order for Hubitat to communicate with the computer there is a continuous loop running on the computer checking Hubitat  
The loop running on the computer interrogates virtual switches set in Hubitat. 
When the virtual switch is turned on the smart action is triggered.

Mediator - Design Pattern
A mediator is responsible for controlling and coordinating the interactions of a group of objects.
The mediator serves as an intermediary that keeps objects in the group from referring to each other explicitly. The objects only know the mediator,
thereby reducing the number of interconnections.

Mediator helps to facilitate the interaction between objects in a manner in that objects are not aware of the existence of other objects. Objects depend only on a single mediator class instead of being coupled to dozens of other objects.


Hubitat  (Maker API) <-- Mediator (PC vbs) --> PC actions


Observer - Design Pattern
Also known as: Event-Subscriber, Listener
Observer pattern falls under behavioral pattern category.
Generically, the object that is being viewed is called the Subject, and objects that are viewing are called Observers.

Observer is a behavioral design pattern that lets you define a subscription mechanism to notify multiple objects about any events that happen to the object they’re observing.

Comparing Observer and Publish Subscribe
- The observer pattern needs to be implemented in a single-application address space. 
- On the other hand, the publisher-subscriber pattern is more of a cross-application pattern.
- In the observer pattern, the observer (Student) is aware of the Subject (Teacher).  
- The observer pattern is mostly implemented synchronously,
-  i.e. The Subject (Teacher) calls the appropriate method of all its observers (Students) when an event occurs (Lunch time). 

- Whereas, in publisher-subscriber, publishers and subscribers don’t need to know each other. They simply communicate with the help of message queues or a broker.
- In the publisher-subscriber pattern, components are loosely coupled as opposed to the observer pattern.
- The publisher-subscriber pattern is mostly implemented asynchronously (using a message queue).

Real World Example
Observer pattern is supposedly the most relatable pattern around. In some way, whenever anyone is notified of something which they were interested in, that essentially is observer pattern. Sometimes people confuse it for publish-subscribe which is a little different where in you are delivered a message asynchronously for the topic you have subscribed to.

The Publish/Subscribe pattern, also known as pub/sub, is an architectural design pattern that provides a framework for exchanging messages between publisher (Hubitat API)and subscriber (PC). This pattern involves the publisher(Hubitat API) and the subscriber relying on a message broker that relays messages from the publisher (Hubitat API) to the subscribers (Google sheet). The host (publisher) publishes messages (events) to a channel(Weather Radar) that subscribers (PC) can then sign up to.

The host (publisher) Host(Hubitat) publishes messages (events) (Switch value) to a channel that subscribers (PC)can then sign up to.

Host/Publisher (Hubitat ) - publishes messages/events, set the switch value
Message broker  (PC) - make the messages available
- Virtual switch (Channel ) - channel for posting and retrieving messages.
- Event (Message) - ON / OFF 
Subscriber (Windows PC ) - use the message value  to Do something

The inputs talk to the Publisher (Hubitat)
Input1(Hubitat device button)
Input2 (Alexa voice command)
Input3 (IR remote)

The outputs the Subscribers talk to the Message broker
Output1 (Computer)
Output2 (IFTTT)




Here is a good real world example. You have moved to a new area and are searching for a good pre school for your child. You zero in on one but there are no vacancies left. Administrator tells you that some seats might get vacant in a month since some families might move out of area. You give them your phone number and ask them to keep you updated of any change. After a month, you get a call that there is a spot available for your child and you are in. Observer pattern helped you get admission for your child.

A real world example of observer pattern can be any social media platform such as Facebook or twitter. 
When a person updates his status – all his followers gets the notification.
A follower can follow or unfollow another person at any point of time. Once unfollowed, person will not get the notifications from subject in future.

Imagine that you have two types of objects: a Customer and a Store. 
The customer is very interested in a particular brand of product (say, it’s a new model of the iPhone) which should become available in the store very soon.

The customer could visit the store every day and check product availability. But while the product is still en route, most of these trips would be pointless.

On the other hand, the store could send tons of emails (which might be considered spam) to all customers each time a new product becomes available. This would save some customers from endless trips to the store. At the same time, it’d upset other customers who aren’t interested in new products.

It looks like we’ve got a conflict. Either the customer wastes time checking product availability or the store wastes resources notifying the wrong customers.

If you subscribe to a newspaper or magazine, you no longer need to go to the store to check if the next issue is available. Instead, the publisher sends new issues directly to your mailbox right after publication or even in advance.

The publisher maintains a list of subscribers and knows which magazines they’re interested in. Subscribers can leave the list at any time when they wish to stop the publisher sending new magazine issues to them.

Reference - https://refactoring.guru/design-patterns/observer


Sounds like a thermostat.  Which design pattern is like as thermostat  ?

Model View Controller - thermostat example 
Model (internal data) - is the current temperature and other values that have been set
Controller((adjust the on and off values) - allows you to set the temperature 
View(display the values)

The View (subscribes) to the Model information and tells the Controller to handle user input
The View requests display info from the Model
The Controller sends setting data to the Model

Example of loose coupling
The View can change from Analog to Digital 
The Controller can change from settings in Celsius to Fahrenheit the Model doesn't care  it just holds the info

Program to an interface not an implementation


Reference - https://books.google.com/books?id=C3NjONZuoAMC&pg=PA42&lpg=PA42&dq=which+computer+design+pattern+is+like+a+%22thermostat%22&source=bl&ots=DsQ7gcJuHN&sig=ACfU3U1hdxMgfNViuFd0IaInP_EIMAGrvQ&hl=en&sa=X&ved=2ahUKEwj3y6uS39XyAhWJlGoFHSdZDEkQ6AF6BAgeEAM#v=onepage&q=which%20computer%20design%20pattern%20is%20like%20a%20%22thermostat%22&f=false


Use looping batch file on PC could to poll Hubitat  Maker API
@echo off
:start
   Call VBS that uses Hubitat Maker API to return a value 
   Test the value
goto start
When the poll returns a value != "off" Then Do something



Looks like if I want to use Alexa I need Hubitat interrogation

Have PC press the PC control button 1
http://192.168.2.84/apps/api/1376/devices/1621/push/1?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5


Authorize device to use Maker API
dev:16212021-08-19 03:03:39.593 pm infoPC control button button 1 was pushed

Get Device Info (replace [Device ID] with actual subscribed device id
http://192.168.2.84/apps/api/1376/devices/1621?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5



Return a value from a windows batch command
Use environmental variables that can be set and retrieved 

Hubitat’s preferred method is to use their published Maker API. 
Although, as you know, it can only publish updates automatically to a single device. 
I wonder what would happen if one chose to use a LAN broadcast IP address? 
I have no idea if that would work, or how much negative impact it would have on a home LAN?

Problems
Problems: What to do when the Hubitat Hub turns OFF (4 am)
Problem: not able to start Chrome after adding launch loops the Task Scheduler
