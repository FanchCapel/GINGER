import Sortable from 'sortablejs';

const initSortable = () => {
  const list = document.querySelector('#sortable-activities');
  Sortable.create(list);
};

export { initSortable };
