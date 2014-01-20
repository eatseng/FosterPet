FosterPet.Collections.Testimonials = Backbone.Collection.extend({
  model: FosterPet.Models.Testimonial,
  url: function() {
      return "pets/" + this.id + "/testimonials/";
  }

});