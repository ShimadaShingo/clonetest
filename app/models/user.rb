# encoding: UTF-8
class User < ActiveRecord::Base
  attr_accessible :authlevel, :contact1, :contact2, :contact3, 
                  :create_user, :family_kana, :family_name, :first_kana, :first_name,
                  :mail1, :mail2, :mail3, :notice, :pw, :sendmail, :update_user,
                  :lock_version,:pw_confirmation

  #バリデーション定義

  #
  validates :family_name,:first_name,
             :length => 1..10

  validates :family_kana,:first_kana,
             :length => 1..30

  validates :contact1,
            :length => 1..16

  validates :contact2,:contact3,
            :length => 1..16,
            :allow_blank => true

  validates :mail1,
            :length => 1..30,
            :format => (/^[a-zA-Z0-9_¥.¥-]+@[A-Za-z0-9_¥.¥-]+\.[A-Za-z0-9_¥.¥-]+$/)

  validates :mail2,:mail3,
            :length => 0..30,
            :allow_blank => true,
            :format => (/^[a-zA-Z0-9_¥.¥-]+@[A-Za-z0-9_¥.¥-]+\.[A-Za-z0-9_¥.¥-]+$/)

  validates :authlevel,
            :numericality => {:only_integer => true,:greater_than_or_equal_to =>0, :less_than_or_equal_to => 20}

  validates :pw,
            :length => 4..20

  validates :notice,:sendmail,
            :numericality => {:only_integer => true,:greater_than_or_equal_to =>0, :less_than_or_equal_to =>1 }

  validates_confirmation_of :pw

#  # 空白不可
#  validates_presence_of :family_name,:first_name,:family_kana,:first_kana,:contact1,:mail1,:authlevel,:pw

#  #　桁数チェック
#  validates_length_of :family_name,:first_name,
#  :in => (1..10),
#                     :too_short => ":1文字以上入力してください",
#                     :too_long => ":10文字以内で入力してください"
#
#  validates_length_of :family_kana,:first_kana ,:mail1,:mail2,:mail3,
#  :in => (1..30),
#                     :too_short => ":1文字以上入力してください",
#                     :too_long => ":30文字以内で入力してください"
#
#  validates_length_of :contact1,:contact2 ,:contact3,
#  :in => (1..16),
#                     :too_short => ":1文字以上入力してください",
#                     :too_long => ":16文字以内で入力してください"
#
#   validates_length_of :pw,
#  :in => (4..20),
#                     :too_short => ":4文字以上入力してください",
#                     :too_long => ":20文字以内で入力してください"
#
#  validates_length_of :authlevel,
#  :in => (1..2),
#
end
