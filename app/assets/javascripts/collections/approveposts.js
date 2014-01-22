FosterPet.Collections.ApprovePosts = Backbone.Collection.extend({
  model: FosterPet.Models.Postshare,
  url: '/postshares'
});