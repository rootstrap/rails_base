task :code_analysis do
  sh 'bundle exec rubocop lib spec bin'
  sh 'bundle exec reek lib bin'
end
