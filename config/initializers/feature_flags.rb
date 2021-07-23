Flipper.register(:admins) do |actor|
  actor.try(:admin)
end

Flipper.register(:editors) do |actor|
  actor.try(:editors)
end

Flipper.register(:readers) do |actor|
  actor.try(:readers)
end

