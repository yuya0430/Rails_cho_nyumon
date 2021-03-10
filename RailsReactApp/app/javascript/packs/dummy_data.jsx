// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

var target_dom = null;

document.addEventListener('DOMContentLoaded', () => {
  target_dom = document.querySelector('#data');
  const url = new URL(location.href);
  let f = url.searchParams.get("name")
  if (f == null){ f = '';}
  getData(f);
});

function getData(f) {
    let url = "http://localhost:3000/data/ajax";
    fetch(url)
    .then(
        res => res.json(),
        (error) => {
            const el = (
                <p>ERROR!!</p>
            );
            ReactDOM.render(el, target_dom);
        }
    )
    .then(
        (result) => {
            console.log(result)
            let arr = [];
            for(let n in result.rss.channel.item){
                let data = result.rss.channel.item[n];
                arr.push(
                    <tr>
                        <th><a href={data.link}>{data.title}</a></th>
                        <td class="small">{data.pubDate}</td>
                    </tr>
                );
            }
            const el = (
                <table class="table mt-4">
                    <thead class="thead-dark">
                        <tr><th>Yahooo!ニュース・トピックス・主要</th>
                        <th>Date</th></tr>
                    </thead>
                    <tbody>{arr}</tbody>
                </table>
            );
            ReactDOM.render(el, target_dom);
        },
        (error) => {
            console.log(error);
            const el = (
                <p>ERROR!!</p>
            );
            ReactDOM.render(el, target_dom);
        }
    );
}
