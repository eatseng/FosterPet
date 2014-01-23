FosterPet.Collections.Pets = Backbone.Collection.extend({
  model: FosterPet.Models.Pet,
  url: '/pets',
  parse: function(response) {
    this.page = parseInt(response.page, 10);
    this.total_pages = parseInt(response.total_pages, 10);
    return response.models;
  }
});