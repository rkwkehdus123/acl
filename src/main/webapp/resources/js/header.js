 // 모달
const body = document.querySelector('body');
const modal = document.querySelector('.modal');
const modal_open = document.querySelector('.modal_open');
  
        modal_open.addEventListener('click', () => {
    modal.classList.toggle('show');
  
            if (modal.classList.contains('show')) {
        body.style.overflow = 'hidden';
            }
        });
  
        modal.addEventListener('click', (event) => {
    if (event.target === modal) {
        modal.classList.toggle('show');
  
            if (!modal.classList.contains('show')) {
        body.style.overflow = 'auto';
        }
    }
});
// 모달 끝