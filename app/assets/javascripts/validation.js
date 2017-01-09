var Validation = {
  presence: function(value) {
    return value ? [] : ['can\'t be blank'];
  },
  email: function(value) {
    if (!value) {
      return ['can\'t be blank'];
    } else if (!(/^[\w\d._-]+@[\w\d.-]+\.[\w\d.]+$/.test(value))) {
      return ['is invalid'];
    }

    return [];
  }
}
