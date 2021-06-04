document.addEventListener('DOMContentLoaded', function(event) {

  window.selectedRooms = [];
  window.selectedActivitities = [];

  window.onBookButtonClick = (event) => {
    const $btn = $(event.target);
    const bookableId = $btn.parent().data('bookableId');
    const bookableType = $btn.parent().data('bookableType');

    switch (bookableType) {
      case 'room':
        handleforRoom(bookableId, $btn);
        break;
      case 'activity':
        handeForActivity(bookableId, $btn);
        break;
    }
    toggleReserveButton();
    setRoomsAndActivitiesForForm();
  }

  const handleforRoom = (id, $btn) => {
    if ($btn.hasClass('selected')) {
      cancelRoom(id, $btn);
    } else {
      bookRoom(id, $btn);
    }
  }

  const handeForActivity = (id, $btn) => {
    if ($btn.hasClass('selected')) {
      cancelActivity(id, $btn);
    } else {
      bookActivity(id, $btn);
    }
  }

  const selectBtn = ($btn) => {
    $btn.addClass('selected');
    $btn.removeClass('btn-primary');
    $btn.addClass('btn-secondary');
    $btn.text('Cancel');
  }

  const deselectBtn = ($btn) => {
    $btn.removeClass('selected');
    $btn.removeClass('btn-secondary');
    $btn.addClass('btn-primary');
    $btn.text('Book');
  }

  const bookRoom = (roomId, $btn) => {
    window.selectedRooms.push(roomId);
    selectBtn($btn);
  }

  const cancelRoom = (roomId, $btn) => {
    const indexToRemove = window.selectedRooms.indexOf(roomId);
    if (indexToRemove !== -1 ) {
      window.selectedRooms.splice(indexToRemove, 1);
    }
    deselectBtn($btn)
  }

  const bookActivity = (activityId, $btn) => {
    window.selectedActivitities.push(activityId);
    selectBtn($btn);
  }

  const cancelActivity = (activityId, $btn) => {
    const indexToRemove = window.selectedActivitities.indexOf(activityId);
    if (indexToRemove !== -1 ) {
      window.selectedActivitities.splice(indexToRemove, 1);
    }
    deselectBtn($btn)
  }

  const toggleReserveButton = () => {
    const $button = $('#reserve');
    const { selectedRooms, selectedActivitities } = window;
    if(selectedRooms.length === 0 && selectedActivitities.length === 0) {
      $button.addClass('disabled');
      return;
    }
    $button.removeClass('disabled');
  }

  const setRoomsAndActivitiesForForm = () => {
    const { selectedRooms, selectedActivitities } = window;

    $('#activities-input').prop('value', selectedActivitities);
    $('#rooms-input').prop('value', selectedRooms);
  }

  $('.book-btn').on('click', (event) => { window.onBookButtonClick(event); });

  $('#starts_at').on('change', function(event) {
    const newValue = $(event.target).prop('value');
    $('#starts-at-input').prop('value', newValue);
  })

  $('#ends_at').on('change', function(event) {
    const newValue = $(event.target).prop('value');
    $('#ends-at-input').prop('value', newValue);
  })
});
