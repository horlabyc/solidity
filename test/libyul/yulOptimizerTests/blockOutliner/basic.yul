{
	{
		let a let b let c let d
		{
			a := mul(c,b)
			if lt(a,c) {
				a := add(a,c)
			}
		}
		{
			if eq(1,2) {
				d := mul(a,b)
				if lt(d,a) {
					d := add(d,a)
				}
			}
			{
				d := add(d,a)
			}
		}
		{
			c := mul(a,b)
			if lt(c,a) {
				c := add(c,a)
			}
		}
	}
	function f(a, b) -> r {
	    {
			r := mul(a,b)
			if lt(r, a) {
			    r := add(r,a)
			}
		}
		function g(x, y) -> z {
		    z := mul(x,y)
			if lt(z,x) {
			    z := add(z,x)
			}
		}
		r := g(b,a)
	}
	function h(a) -> r {
		{
		    r := add(r,a)
		}
		{
		    r := add(r,a)
		}
	}
}
// ====
// step: blockOutliner
// ----
// {
//     {
//         let a
//         let b
//         let c
//         let d
//         { a := _2(a, b, c) }
//         {
//             if eq(1, 2) { d := _2(d, b, a) }
//             { d := _1(d, a) }
//         }
//         { c := _2(c, b, a) }
//     }
//     function g(x, y) -> z
//     { z := _2(z, y, x) }
//     function f(a_1, b_2) -> r
//     {
//         { r := _2(r, b_2, a_1) }
//         r := g(b_2, a_1)
//     }
//     function h(a_3) -> r_4
//     {
//         { r_4 := _1(r_4, a_3) }
//         { r_4 := _1(r_4, a_3) }
//     }
//     function _1(a, c) -> a_4
//     {
//         a := add(a, c)
//         a_4 := a
//     }
//     function _2(a, b, c) -> a_5
//     {
//         a := mul(c, b)
//         if lt(a, c) { a := _1(a, c) }
//         a_5 := a
//     }
// }
