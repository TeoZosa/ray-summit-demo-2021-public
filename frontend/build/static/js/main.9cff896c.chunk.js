(this["webpackJsonpmy-app"]=this["webpackJsonpmy-app"]||[]).push([[0],{42:function(e,t,n){},44:function(e,t,n){},74:function(e,t,n){"use strict";n.r(t);var a,c,r=n(0),s=n.n(r),i=n(15),o=n.n(i),d=(n(42),n(16)),h=n.n(d),u=n(33),l=n(17),j=(n(44),n(9)),b=(n(50),n(34)),p=n.n(b),g=n(18),m=n(19),O=n(1),f=n(2);Object(j.addResponseMessage)("Hello! I'm here to help answer questions you might have about Ray. What can I help you with today?");var w=g.a.div(a||(a=Object(l.a)(["\n  overflow:hidden;\n  width: 100vw;\n  height: 100vh;\n"]))),v=g.a.iframe(c||(c=Object(l.a)(["\n  width: 100vw;\n  height: 100vh;\n  border: 0;\n"])));function x(){Object(O.d)().pathname;var e=function(){var e=Object(u.a)(h.a.mark((function e(t){var n,a;return h.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return Object(j.toggleMsgLoader)(),e.next=3,p.a.get("/chat",{params:{msg:t}}).finally((function(){Object(j.toggleMsgLoader)()}));case 3:n=e.sent,a=n.data,Object(j.renderCustomComponent)(y,a,!0);case 6:case"end":return e.stop()}}),e)})));return function(t){return e.apply(this,arguments)}}();return Object(f.jsxs)(w,{children:[Object(f.jsx)(v,{src:"https://ray.io",name:"docs"}),Object(f.jsx)(j.Widget,{title:"Ray Support Bot",subtitle:"How can I help you today?",senderPlaceHolder:"Ask me a question...",handleNewUserMessage:e})]})}var y=function(e){var t=e.message,n=e.link,a=e.header,c=new Date,s=Object(r.useRef)(c.toLocaleTimeString([],{hour:"2-digit",minute:"2-digit"})),i=!n.includes("http"),o=Object(O.d)().pathname;return Object(f.jsx)(f.Fragment,{children:Object(f.jsxs)("div",{className:"rcw-response",children:[Object(f.jsxs)("div",{className:"rcw-message-text",children:[Object(f.jsx)("p",{children:t}),i?Object(f.jsxs)(m.b,{to:n,onClick:function(){n.includes(o)&&(window.frames.docs.location="https://docs.ray.io".concat(n))},children:[" ",a," "]}):Object(f.jsx)("a",{href:n,target:"_blank",rel:"noreferrer",children:a})]}),Object(f.jsx)("span",{className:"rcw-timestamp",children:s.current})]})})},k=function(){return Object(f.jsx)(m.a,{children:Object(f.jsx)(x,{})})},C=function(e){e&&e instanceof Function&&n.e(3).then(n.bind(null,75)).then((function(t){var n=t.getCLS,a=t.getFID,c=t.getFCP,r=t.getLCP,s=t.getTTFB;n(e),a(e),c(e),r(e),s(e)}))};o.a.render(Object(f.jsx)(s.a.StrictMode,{children:Object(f.jsx)(k,{})}),document.getElementById("root")),C()}},[[74,1,2]]]);
//# sourceMappingURL=main.9cff896c.chunk.js.map