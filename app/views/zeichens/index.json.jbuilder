json.set! :bubbles do
  json.array! @zeichens do |z|
    json.name z.name
    json.picture z.picture
    json.message z.text
  end
end

json.next_page @next_page