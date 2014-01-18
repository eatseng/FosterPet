FosterPet.Collections.Feeds = Backbone.Collection.extend({
  model: FosterPet.Models.Post,
  url: '/feeds'
});