/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   compare.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sdestann <sdestann@student.42perpignan.    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/03/12 14:59:58 by sdestann          #+#    #+#             */
/*   Updated: 2024/03/12 15:03:34 by sdestann         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

void	strlen_compare(char *x)
{
	printf("`%s` = %d (%d)\n", x, ft_strlen(x), (int)strlen(x));
}

void	strcmp_compare(char *a, char *b)
{
	printf("`%s`:`%s` = %d (%d)\n", a, b, ft_strcmp(a, b), strcmp(a, b));
}

void	write_compare(char *s, int long x)
{
	printf(" sur %ld char (`%s`:%ld)\n", ft_write(STDOUT_FILENO, s, x), s, x);
}

void	read_compare(char *buffer, int long x, long r)
{
	r = ft_read(STDIN_FILENO, buffer, x);
	printf("`%s`:%ld\n", buffer, r);
}

void	strdup_compare(char *s, char *tmp)
{
	tmp = ft_strdup(s);
	printf("`%s`\n(`%s`)\n", tmp, s);
	free(tmp);
	tmp = NULL;
}
