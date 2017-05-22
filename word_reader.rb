class WordReader
  # читает слово из командной строки
  def read_from_args
    return ARGV[0]
  end

  # пишет случайное слово из приготовленного файла, если не ввели слово
  def read_from_file(file_name)

    begin
      file = File.new(file_name, "r:UTF-8")
      lines = file.readlines
      file.close
    rescue SystemCallError
      abort "Файл со словами не найден!"
    end

    # return lines.sample.chomp
    return UnicodeUtils.downcase(lines.sample.chomp)
  end
end