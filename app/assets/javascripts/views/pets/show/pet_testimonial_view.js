FosterPet.Views.PetTestimonialView = Backbone.View.extend({
  initialize: function(options) {
    this.pet = options.pet;
    this.testimonial_collection = options.testimonial_collection;
    this.listenTo(this.testimonial_collection, "add remove change sync", this.render);
  },

  events: {
    "click .btn-testimonial" : "submitTestimonial"
  },

  template: JST['pets/testimonial'],
  templateForm: JST['pets/testimonial_form'],

  render: function() {
    var renderedContent = this.template({
      testimonials: this.testimonial_collection
    });
    this.$el.html(renderedContent);
  
    this.$('.pet_testimoinal_form#pet_testimonial').html(this.templateForm({
      pet: this.pet
    }));
    return this;
  }

});