import Sortable from 'sortablejs';

const initSortable = () => {
  const list = document.querySelector('#sortable');
  Sortable.create(list);
};

export { initSortable };
