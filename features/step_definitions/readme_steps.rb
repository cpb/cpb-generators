Given(/^a Gemfile setup with:$/) do |file_content|
  unset_bundler_env_vars
  write_file("Gemfile", file_content)
  run_simple(unescape("bundle install"), false)
end
