FosterPet.Collections.Pets = Backbone.Collection.extend({
  model: FosterPet.Models.Pet,
  url: '/pets'
});