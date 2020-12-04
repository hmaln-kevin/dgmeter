namespace :dev do
  desc "Standart user and admin"
  task setup: :environment do
    if Rails.env.development?
      # show_spinner("Apagando BD...") { %x(rails db:drop) }
      # show_spinner("Criando BD...") { %x(rails db:create) }
      # show_spinner("Migrando BD...") { %x(rails db:migrate) }
    end
      show_spinner("Criando usuários padrão") { %x(rails dev:add_default) }
  end

  desc "Adiciona usuários padrão"
  task add_default: :environment do
    User.create!(
      email: 'admin@admin.com',
      password: 123456,
      password_confirmation: 123456,
      name: "admin",
      admin: true
    )
    User.create!(
      email: 'user@user.com',
      password: 123456,
      password_confirmation: 123456,
      name: "first_user",
      admin: false
    )
  end
end

private

def show_spinner(msg_start, msg_end = "Concluído!")
  spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
  spinner.auto_spin
  yield
  spinner.success("(#{msg_end})")
end