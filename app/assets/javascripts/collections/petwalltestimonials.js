FosterPet.Collections.PetWallTestimonials = Backbone.Collection.extend({
  initialize: function(pet_id) {
    this.pet_id = pet_id;
  },


  model: FosterPet.Models.Testimonial,
  
  url: function() {
      return "pets/" + this.id + "/testimonials/";
  }

});