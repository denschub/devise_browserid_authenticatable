devise_browserid_authenticatable
================================

Written by Dennis Schubert

devise_browserid_authenticatable is a module to add [BrowserID/Persona](https://persona.org)
authentication support to [Devise](http://github.com/plataformatec/devise) applications.

The warden strategy was written for use in Rails 3.1 and Devise 2 application, but they should
work in other configurations, too.

Contributions are welcome.

Installation
------------

To install the gem, just add a

    gem "devise_browserid_authenticatable"

to your Gemfile and run ```bundle install```.

Create the initializer running ```rails generate browser_id:install```.

To enable the warden strategy, add the following lines to ```config/initializers/devise.rb```:

    config.warden do |manager|
      manager.default_strategies(:scope => :user).unshift :browserid_authenticatable
    end

Using the 'Sign in with persona' button
---------------------------------------

There is a view helper called ```browserid_js_tag``` to include the BrowserID javascript
file matching the current environment (development or production). To use it, simply add

    <%= browserid_js_tag %>

to your application layout inside the header.

Next you have to find and download a matching button for your application. There are some nice
buttons (even CSS-only buttons) available, check out [the MDN page](https://developer.mozilla.org/en-US/docs/persona/branding)
to find one.

I like to wrap a link around the image tag so your template could look like

    <%= link_to (image_tag "persona-button.png", :class => "persona-login-button"), '#' %>


Next you need to add some JavaScript to do the actual sign in process. The JavaScript could look
like this (you will find an explanation below the code):

    $(".persona-login-button").click(function(e) {
      e.preventDefault();

      navigator.id.get(function(assertion) {
        if (assertion) {
          $.ajax({
            url: '/users/sign_in',
            type: "POST",
            dataType: "json",
            cache: false,
            data: {
              "assertion": assertion
            },
            success: function(data, status) {
              window.location.href = '/';
            },
          });
        }
      });
    });


The JavaScript snippet is calling the [navigator.id.get-function](https://developer.mozilla.org/en-US/docs/DOM/navigator.id.get)
when the user clicked on the sign in button to get an assertion from BrowserID. Check out the linked MDN page
for information about how to add terms of service and privacy policies if you want to. The callback
function posts the assertion asynchronous to the Rails application (the sign_in-path) to check it. When the
check was successful, the script will redirect the user to your application root path.

Feel free to add error handling.
