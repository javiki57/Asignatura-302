

%%
%int

Palabra     = [a-zA-Z]
Vocal       = [aeiouAEIOU]
Consonante  = [b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]

%%

/* Tipo C */ 
{Palabra}*{Vocal}{Vocal}+{Palabra}*{Consonante}+        {cpv.C++;}

/* Tipo A */
{Palabra}*{Vocal}{Vocal}+{Palabra}*                {cpv.A++;}

/*Tipo B */

{Palabra}*{Vocal}+                                 {cpv.B++;}

/*Tipo D*/

{Palabra}*{Consonante}+                            {cpv.D++;}

/* Todo lo demás */
[^]						   {/* Ignorar */}
