ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def decipher(str)
  alpha_caps = ("A".."Z").to_a * 2
  alpha_small = ("a".."z").to_a * 2

  idx = 0
  result = str.chars.map do |letter|
    if alpha_caps.include? letter
      idx = alpha_caps.index(letter)
      alpha_caps[idx - 13]
    elsif alpha_small.include? letter
      idx = alpha_small.index(letter)
      alpha_small[idx - 13]
    else
      letter
    end
  end

  p result.join
end

ENCRYPTED_PIONEERS.each { |name| decipher(name) }
