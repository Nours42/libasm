/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nours42 <nours42@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/03/08 19:38:53 by nours42           #+#    #+#             */
/*   Updated: 2024/03/09 14:18:05 by nours42          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>

# define STRLEN(x) printf("`%s` = %d (%d)\n", x, _ft_strlen(x), (int)strlen(x));

int _ft_strlen(char const *str);

int main(void)
{
    printf("--strlen\n");
	STRLEN("")
	STRLEN("toto")
	STRLEN("totototo")
	STRLEN("0123456789abcdef")
	STRLEN("42")
	STRLEN("1")
	printf("-done\n");

    return (0);
}