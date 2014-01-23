FosterPet.Collections.PetWallTestimonials = Backbone.Collection.extend({
  initialize: function(pet_id) {
    this.pet_id = pet_id;
  },

  model: FosterPet.Models.Testimonial,

  url: function() {
    return "pets/" + this.pet_id + "/testimonials/";
  },
  comparator: function(val1, val2) {
    if (val1.get('created_at') > val2.get('created_at')) {
      return -1;
    } else if (val1.get('created_at') < val2.get('created_at')) {
      return 1;
    } else {
      return 0;
    }
  }
});