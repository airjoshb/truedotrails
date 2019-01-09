# SJABLOON README

Thanks for using the Sjabloon to get a flying start with your new Ruby on Rails project! 🎊

The application is run by running `foreman start`. It uses the `Procfile` in the root of this directory.

## Setup
There are a few steps you have to do manually. They are listed below.

### Rails Credentials
Sjabloon uses Rails credentials (it's how your Sendgrid integration is set up). If your new to Rails credentials, you can read this: https://medium.com/cedarcode/rails-5-2-credentials-9b3324851336
You can access these using `EDITOR="vim -f" rails credentials:edit`, where you can replace `vim` with your editor of choice. You can use this template:
```yml
secret_key_base:
default: &default

development:
  <<: *default
  stripe:
    publishable_key: ''
    api_key: ''

production:
  <<: *default
  stripe:
    publishable_key: ''
    api_key: ''
  
  sendgrid:
    user_name: ''
    password: ''
  
  
  
  
  
  
```



#### Sendgrid
If you don't have a Sendgrid account, go here: [https://sendgrid.com](https://sendgrid.com)

## Modern front end
Sjabloon utilises a lean, but modern front end. Webpack as the Javascript bundler (default with Rails 5+), PostCss to add some magic to your Css, Tailwind as the utility-first CSS framework and Stimulus as the JS framework. These tools are proven to make sure you make powerful web applications, without overly complicating stuff. All powerful enough to get that important first version out of the door.

### [Webpack](https://webpack.js.org)
Webpack comes by default with every new Rails (5+) application using the [Webpacker gem](https://github.com/rails/webpacker). In development it's run as `./bin/webpack --watch --colors --progress` with [Foreman](https://github.com/ddollar/foreman).

### [PostCss](https://https://postcss.org)
Also PostCss comes as default with Rails 5+. It's a tool to transform your CSS with Javascript. As such it can do everything Scss/Sass does, and a lot more. A lot! It works by adding small plugins that do one thing well. Sjabloon comes with the following plugins installed for you:

- [postcss-import](https://github.com/postcss/postcss-import). See how this is used in `frontend/stylesheets/application.css`
- [postcss-preset-env](https://github.com/csstools/postcss-preset-env) A set of plugins to convert modern CSS into something browsers understand today.
- [postcss-nested](https://github.com/postcss/postcss-nested) This unwraps nested styles similar to Scss/Sass.

### [Tailwind](https://tailwindcss.com)
Tailwind is a utility-first Css framework. It solely consist of one-off classes, like `.mb-4`, `.text-white` and `.text-base`. This lets you create UI's really quick as you only have to add some classes to build a component. And once you reuse a component, you can extract the class into its own Css selector with `@apply`. Check `frontend/stylesheets/tailwind.js` for all setup and settings. And then one of the Css files in `frontend/stylesheets/components`. [See here for some components examples](https://www.getsjabloon.com/features/ui-components).

### [Stimulus](https://stimulusjs.org)
Stimulus is a nice and modest framework that allows you to add just enough JS to make your UI shine. No crazy new templating, but the HTML you already use.

Since this front end is not reliant on Sprockets (although you opted to include it in this template), all front end related code is in `/frontend` instead of `app/assets`. So, if you really need to include another JS framework, like React or Vue, this folder is the perfect place for it too. _Your `ERB` view files can still be found in `/app/views` though._

## Transactional emails
“Transactional emails” are emails such as email confirmation, password reset link, etc.
In **development**, [letter_opener](https://github.com/ryanb/letter_opener) is included. It's an easy way to preview in real-time (instead of the default log output). Check `config/environments/development.rb` how this is set up.
You can also go to [http://localhost:5000/rails/mailers](http://localhost:5000/rails/mailers) to preview the emails in the browser. `reset_password_instructions` is defined here to preview the reset password email from Devise (be sure there is at least one User in the database).
In **production**, you use Sendgrid for your transactional emails. Be sure to add the environment variables `DOMAINNAME` (eg. https://www.getsjabloon.com) and `NAKED_DOMAINNAME` (eg. getslabloon.com). Check in `config/environments/production.rb` how these are used.

### Email design
All styles for the emails can be found in `frontend/stylesheets/emails.css`. These styles are automatically inlined using the [Premailer gem](https://github.com/premailer/premailer) ensuring emails look good in multiple email clients. It also creates a text variant of the email for you.

## Deploying your app
To have a smooth deploy, be sure to add the contents of `config/master.key` to your environment variables as `RAILS_MASTER_KEY`. It's really important to never share this `RAILS_MASTER_KEY` in any shared repository or public space! By default it's excluded from Git, through the `.gitignore` file.

Don't know where to deploy your app? I can highly recommend the combo [DigitalOcean](https://m.do.co/c/5ca1e8d17563) and [Hatchbox](https://hatchbox.io/?via=sjabloon). Other hosting services (that can be used with Hatchbox) are: Linode and Vultr.
