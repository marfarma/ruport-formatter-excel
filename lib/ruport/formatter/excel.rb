require 'rubygems'
require 'ruport'
require 'spreadsheet'
require 'stringio'

Spreadsheet.client_encoding = "UTF-8"

class Ruport::Formatter::Excel < Ruport::Formatter
  renders :excel, :for => Ruport::Controller::Table

  def output
    retval = StringIO.new

    if options.workbook
      book = options.workbook
    else
      book = Spreadsheet::Workbook.new
    end

    if options.worksheet_name
      book_args = { :name => options.worksheet_name }
    else
      book_args = { }
    end

    sheet = book.create_worksheet(book_args)

    offset = 0

    if options.show_table_headers
      sheet.row(0).default_format = Spreadsheet::Format.new(
        options.format_options || 
        { 
          :color => :blue,
          :weight => :bold,
          :size => 18
        }
      )
      sheet.row(0).replace data.column_names
      offset = 1
    end

    data.data.each_with_index do |row, i|
      sheet.row(i+offset).replace row.attributes.map { |x| row.data[x] }
    end

    if options.file
      return book.write options.file
    elsif options.to_string
      book.write retval
      retval.seek(0)
      return retval.read
    end

    return book
  end
end
