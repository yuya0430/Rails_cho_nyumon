// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

const Calc = props => {
  let n = props.number;
  let total = 0;
  for (let i = 0;i <= n;i++){
    total += i;
  }
  return (
    <div>ゼロから {props.number} までの合計は，「{total}」です．</div>
  );
}

Calc.defaultProps = {
  number: 0
}

Calc.propTypes = {
  number: PropTypes.integer
}

document.addEventListener('DOMContentLoaded', () => {
  let el = (<div>
    <Calc number="100" />
    <Calc number="200" />
    <Calc number="300" />
  </div>);
  let dom = document.querySelector('#hello');
  ReactDOM.render(el, dom);
})
