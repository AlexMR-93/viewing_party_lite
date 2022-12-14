RSpec.describe("Login Page") do
  before(:each) do
    @steve = User.create!(    name: "Steve",     email: "steve.smith@gmail.com",     password: "123test",     password_confirmation: "123test")
    @mary = User.create!(    name: "Mary",     email: "mary.smith@gmail.com",     password: "test123",     password_confirmation: "test123")
  end

  it("can log in with valid credentials") do
    user = User.create(    name: "funbucket13",     email: "EEE@email.com",     password: "test",     password_confirmation: "test")
    visit(login_path)
    fill_in(:email,     with: user.email)
    fill_in(:password,     with: user.password)
    click_on("Log In")
    expect(current_path).to(eq(user_path(user)))
    expect(page).to(have_content("Welcome back, #{user.name}!"))
  end
end
