# coding: utf-8

User.create!(name: "管理者",
  email: "sample@email.com",
  password: "password",
  password_confirmation: "password",
  admin: true)

2.times do |n|
name  = Faker::Name.name
email = "sample-#{n+1}@email.com"
password = "password"
User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password)
end

puts "Users Created"

admin_user = User.first

admin_user.tasks.create!(name: "🇪🇹エチオピア",
  description: "エチオピアのコーヒー豆は世界最高の香りを誇ります。

  またフルーティーな香りと酸味が強いのも特徴的。
  
  特にアビシニア高原の豆が有名で、ジャスミンのような香りと良く例えられています。
  
  他のコーヒーに比べて苦味が少なく、コクや甘みが控えめ。
  
  ブラジルなどの苦みが強い豆とよくブレンドされています。",
  price: 600
)
admin_user.tasks.create!(name: "🇬🇹グアテマラ",
  description: "グアテマラ産コーヒーはフルーティーな酸味と花のような香りが特長です。

  深いコクがあり、やさしい甘さの後味が上品で飲みやすいでしょう。
  
  産地によって違いがありますが、重めのボディでチョコレートやナッツのような甘みもあります。
  
  重厚なボディのためブレンドのベースにも使われています。",
  price: 600
)
admin_user.tasks.create!(name: "🇧🇷ブラジル",
  description: "ブラジルコーヒーの味というと、程よい苦味と爽やかな酸味、

  コクも感じられ癖がなくあっさりとした後味です。
  
  焙煎度によっても変わってきますが、ブラジル産コーヒー豆の基本的な味わいは、
  
  酸味はやわらかめとナッツやチョコレートの様な甘い香りです。",
  price: 600
)
admin_user.tasks.create!(name: "🇨🇴コロンビア",
  description: "コロンビアは苦味と酸味のバランスが取れていて、クセが少なくきりっとした味わいです。

  強すぎず弱すぎないコクで飲みやすく、落ち着きのある上品さが感じられます。
  
  コーヒー豆そのものの香りや液体の香りからは木の実のような若々しさが感じられ、
  
  一口飲むとフルーツのような芳醇な香りが鼻から抜けていきます。",
  price: 600
)
admin_user.tasks.create!(name: "🇰🇪ケニア",
  description: "ケニアコーヒーは風味が非常に豊かです。

  ベリーや柑橘系のフルーツを想起させる明るい酸味と、やわらかな苦味とコクを持ち合わせており、
  
  バランスの良い味わいです。また、香りが上品で芳香な点も魅力的。
  
  コーヒー豆は大きさで等級分けされるため、肉厚で存在感のある大粒なものが多い傾向にあります。",
  price: 600
)
admin_user.tasks.create!(name: "🇸🇻エルサルバドル",
  description: "エルサルバドル産コーヒー豆の味をひとことで言うと、

  飲みやすいマイルドな酸味とすっきりとした後味が特徴的です。
  
  キャラメルのような甘みを感じることもあり、豊かな香りが楽しめます。
  
  飲んだ後に変な苦味が残ることもないので、あっさりしたコーヒーが好きな人にとっては飲みやすいです。",
  price: 600
)
admin_user.tasks.create!(name: "🇵🇬パプアニューギニア",
  description: "パプアニューギニアのコーヒーは、焙煎中でもフルーティで甘さのある香りを楽しめます。

  浅煎りから深煎りまで、どの焙煎度でも美味しく飲めるのも特長的。
  
  焙煎度に応じて、しっかりと風味の違いが感じることができるでしょう。
  
  一般的に、浅煎りすると酸味が引き立ち、深煎りでは苦味が際立ちます。",
  price: 600
)

puts "Tasks Created"