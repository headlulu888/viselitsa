class ResultPrinter

  # метод конструктор
  def initialize
    @status_image = []

    current_path = File.dirname(__FILE__)

    counter = 0

    while counter <= 7
      file_name = current_path + "/image/#{counter}.txt"

      if File.exist?(file_name)
        file = File.new(file_name, "r:UTF-8")
        @status_image << file.read
        file.close
      else
        @status_image << "\n [ изображение не найдено ]  \n"
      end

      counter += 1
    end
  end

  # выводит на экран виселицу, которая соответствует количеству ошибок
  def print_viselitsa(errors)
    puts @status_image[errors]
  end

  # печатает состояние обьекта класса Game
  def print_status(game)
    cls

    puts
    puts "Слово: #{get_word_for_print(game.letters, game.good_letters)}"
    puts "Ошибки: #{game.bad_letters.join(", ")}"

    print_viselitsa(game.errors)

    if game.status == -1
      puts
      puts "Вы проиграли"
      puts "Загаданное слово было: " + game.letters.join("")
      puts
    elsif game.status == 1
      puts
      puts "Поздравляем, вы выйграли"
      puts
    else
      puts "У вас осталось ошибок: " + (7 - game.errors).to_s
    end
  end


  def get_word_for_print(letters, good_letters)
    result = ""

    for item in letters do
      if good_letters.include?(item)
        result += item + " "
      else
        result += " _ "
      end
    end

    return result
  end

  # метод скрывающий слово в консоли после его ввода
  def cls
    system("cls") || system("clear")
  end
end
