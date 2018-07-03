SMS & Calls documentations
======

The call & messaging solution uses Twilio, for more information please visit: [Twilio Doc](https://github.com/twilio/twilio-ruby), and if you are completely new with twilio, you can take a look at [Twilio quickstart](https://www.twilio.com/docs/sms/quickstart/ruby).

### Getting started (SMS)

There are just a few things to be done:
* Sign up on Twilio
* Configure ENV vars in project
  * TWILIO_ACCOUNT_SID
  * TWILIO_ACCOUNT_TOKEN
  * TWILIO_PHONE_FROM
* Start coding your service call

  ```
  TwilioService.send_text_message(some_user.phone_number, your_awesome_message)
  ```

### Getting started (Calls)
This will come soon