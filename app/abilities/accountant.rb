Canard::Abilities.for(:accountant) do
  can [:manage], User do |u|
    u == user
  end
  cannot [:destory], User
end
