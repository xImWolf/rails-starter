FROM runnable/ruby-starter

# Add Repository
ADD . /app

# Run Server
EXPOSE 3000
CMD rake db:migrate && rails server -b 0.0.0.0
