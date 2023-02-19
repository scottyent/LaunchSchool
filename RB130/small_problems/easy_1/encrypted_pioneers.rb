# Write a program to decipher and print each of the names below, that are
# encrypted using Rot13

# Alogrithm
# lowcase each name to make the ascii numbers work
# split it with chars
# iterate through each letter
# if it's a letter, transform it
  # a - 97
  # n - 110
  # 13 difference

  # z - 122
  # m - 109
  # 13 difference



# if it's a space, re-add a space

require 'pry'
require 'pry-byebug'

names = ["Nqn Ybirynpr",
        "Tenpr Ubccre",
        "Nqryr Tbyqfgvar",
        "Nyna Ghevat",
        "Puneyrf Onoontr",
        "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
        "Wbua Ngnanfbss",
        "Ybvf Unvog",
        "Pynhqr Funaaba",
        "Fgrir Wbof",
        "Ovyy Tngrf",
        "Gvz Orearef-Yrr",
        "Fgrir Jbmavnx",
        "Xbaenq Mhfr",
        "Fve Nagbal Ubner",
        "Zneiva Zvafxl",
        "Lhxvuveb Zngfhzbgb",
        "Unllvz Fybavzfxv",
        "Tregehqr Oynapu"]


def decipher_letter(letter)
  current_loc = letter.ord - 97
  target_loc = ((current_loc + 13) % 26) + 97

  target_loc.chr
end


def break_rot(name_array)
  deciphered_names = []

  name_array.each do |name|
    fixed_name = ''
    name_characters = name.downcase.chars

    name_characters.each do |char|
      if char =~ /[^a-z]/
        fixed_name << char
      else
        # binding.pry
        if fixed_name[-1] =~ /[A-Za-z]/
          fixed_name << decipher_letter(char)
        else
          fixed_name << decipher_letter(char).upcase
        end
      end
    end

    deciphered_names << fixed_name
  end

  puts deciphered_names
end

break_rot(names)