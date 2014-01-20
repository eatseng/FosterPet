FosterPet.Views.PetsShowView = Backbone.View.extend({
  initialize: function(options) {
    this.post_collection = options.post_collection;
    this.testimonial_collection = options.testimonial_collection;
  },

  events: {
    "click button.delete" : "delete",
  },

  templateStructure: JST['pets/show'],

  render: function() {
    var renderedContent = this.templateStructure({
      pet: this.model
    });
    this.$el.html(renderedContent);

    this.headerView = new FosterPet.Views.PetHeaderView({
      $el: this.$('.top_header'),
      model: this.model
    });

    this.petWall = new FosterPet.Views.PetWallView({
      $el: this.$('.pet_wall'),
      post_collection: this.post_collection,
      id: this.id,
      pet: this.model
    });

    this.petTestimonial = new FosterPet.Views.PetTestimonialView({
      $el: this.$('.pet_testimonial'),
      testimonial_collection: this.testimonial_collection,
      id: this.id,
      pet: this.model
    });

    this.$('.top_header').html(this.headerView.render().$el);
    this.$('.pet_wall').html(this.petWall.render().$el);
    this.$('.pet_testimonial').html(this.petTestimonial.render().$el);

    return this;
  },

  delete: function(event) {
    var pet = this.collection.get($(event.target).attr('pet_id'));
    pet.destroy({
      success: function() {
        Backbone.history.navigate("", {trigger:true});
      }
    });
  }
});