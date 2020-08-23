100.times do |n|
  Task.create(title: "サンプルデータです#{n}回目", content:"ラーメン食べました！#{n}回目")
end
