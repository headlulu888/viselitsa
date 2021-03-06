class Game
  attr_reader :status, :errors, :letters, :good_letters, :bad_letters
  # метод конструктор
  def initialize(slovo)
    @letters = get_letters(slovo)

    @errors = 0

    @good_letters = []
    @bad_letters = []

    @status = 0
  end

  # Метод, который возвращает массив букв загаданного слова
  def get_letters(slovo)
    if slovo == nil || slovo == ""
      abort "Не введено загаданное слово. Попробуйте еще раз!"
    end

    return slovo.encode('UTF-8').split("")
  end

  # Основной метод игры "сделать следующий шаг". В качестве параметра принимает
  # букву, которую ввел пользователь.
  def next_step(bukva)
    if status == -1 || status == 1
      return
    end

    if @good_letters.include?(bukva) || @bad_letters.include?(bukva)
      return
    end

    if @letters.include?(bukva)
      @good_letters << bukva

      if @good_letters.uniq.sort == @letters.uniq.sort
        @status = 1
      end
    else
      @bad_letters << bukva
      @errors += 1

      if @errors >= 7
        @status = -1
      end
    end
  end

  # метод спрашивает у юзера букву и возвращает ее как результат
  def ask_next_letter
    puts "\nВведите следующую букву"
    letter = ""
    # пока letter пустой, просим ввессти из консоли
    while letter == ""
      letter = UnicodeUtils.downcase(STDIN.gets.encode("UTF-8").chomp)
    end
    next_step(letter)
  end
end