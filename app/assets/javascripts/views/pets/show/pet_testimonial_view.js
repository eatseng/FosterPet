FosterPet.Views.PetTestimonialView = Backbone.View.extend({
  initialize: function(options) {
    this.pet = options.pet;
    this.testimonial_collection = options.testimonial_collection;
    this.petTestimonials = new FosterPet.Collections.PetWallTestimonials(this.id);
    this.listenTo(this.petTestimonials, "add remove", this.render);
  },

  events: {
    "click .btn-testimonial" : "submitTestimonial"
  },

  template: JST['pets/testimonial'],
  templateForm: JST['pets/testimonial_form'],

  render: function() {
    var that = this;
        
    this.petTestimonials.fetch({
      success: function() {
        var renderedContent = that.template({
          testimonials: that.petTestimonials
        });

        that.$el.html(renderedContent);
      
        that.$('.pet_testimoinal_form#pet_testimonial').html(that.templateForm({
          pet: that.pet
        }));
      }
    });
    return this;
  },

  submitTestimonial: function(event) {
    event.preventDefault();
    var attrs = $('form').serializeJSON();
    var testimonialModel = new FosterPet.Models.Testimonial().set(attrs);
    debugger
    this.petTestimonials.create(testimonialModel, {
      success: function(){
        //Backbone.history.navigate("", {trigger:true});
      }
    });

  }

});