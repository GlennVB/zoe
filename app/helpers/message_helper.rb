module MessageHelper
  def message(message, level, user)
    m = Message.create(text: message,level: level,user: user)
    broadcast(m.text)
  end

  def broadcast(msg)
    system("echo '#{msg}' | festival --tts")
  end
end

