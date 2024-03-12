/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sdestann <sdestann@student.42perpignan.    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/22 14:21:35 by sdestann          #+#    #+#             */
/*   Updated: 2024/03/12 15:12:01 by sdestann         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

void	test_strlen_strcmp(void)
{
	printf("--strlen\n");
	strlen_compare("");
	strlen_compare("toto");
	strlen_compare("totototo");
	strlen_compare("0123456789abcdef");
	strlen_compare("42");
	strlen_compare("1");
	printf("-done\n");
	printf("\n--strcmp\n");
	strcmp_compare("", "");
	strcmp_compare("toto", "toto");
	strcmp_compare("", "toto");
	strcmp_compare("toto", "");
	strcmp_compare("toto", "totobar");
	printf("`%s`:`%p` = %d\n", "TOTO", NULL, ft_strcmp("TOTO", NULL));
	printf("`%p`:`%s` = %d\n", NULL, "TOTO", ft_strcmp(NULL, "TOTO"));
	printf("`%p`:`%p` = %d\n", NULL, NULL, ft_strcmp(NULL, NULL));
	printf("-done\n");
}

void	test_strcpy(char *buffer)
{
	printf("\n--strcpy\n");
	printf("`%s` (`toto`)\n", ft_strcpy(buffer, "toto"));
	printf("`%s` (empty)\n", ft_strcpy(buffer, ""));
	printf("`%s` (`long message`)\n", ft_strcpy(buffer, "long message"));
	printf("`%s` (NULL > not modified)\n", ft_strcpy(buffer, NULL));
	printf("-done\n");
	printf("\n--write\n");
	write_compare("toto", 4L);
	write_compare("totototo", 4L);
	write_compare("totototo", 8L);
	write_compare("toto", 2L);
	printf("-done\n");
}

void	test_read(char *buffer, int i, long r)
{
	printf("\n--read (test.txt)\n50 premiers char de test.txt :\t");
	read_compare(buffer, 50, r);
	i = 0;
	while (i < 100)
		buffer[i++] = 0;
	printf("lit les 25 char suivant :\t");
	read_compare(buffer, 25, r);
	i = 0;
	while (i < 100)
		buffer[i++] = 0;
	printf("lit les 4 char suivant :\t");
	read_compare(buffer, 4, r);
	i = 0;
	while (i < 100)
		buffer[i++] = 0;
	printf("lit les 26 char suivant :\t");
	read_compare(buffer, 26, r);
	i = 0;
	while (i < 100)
		buffer[i++] = 0;
	printf("ne doit rien lire : ");
	read_compare(buffer, 0, r);
	printf("-done\n");
}

int	main(void)
{
	int		i;
	long	r;
	char	buffer[100];
	char	*tmp;
	char	*tmp2;

	r = 0;
	i = 0;
	while (i < 100)
		buffer[i++] = 0;
	test_strlen_strcmp();
	test_strcpy(buffer);
	test_read(buffer, i, r);
	printf("\n--ft_strdup\n");
	tmp = "";
	tmp2 = ft_strdup("toto");
	strdup_compare(tmp2, tmp);
	free(tmp2);
	strdup_compare("totobar", tmp);
	strdup_compare("Lorem ipsum dolor sit amet, consectetur adipiscing elit. \
		Suspendisse iaculis metus dolor, id dictum lacus pretium in. Nullam \
		tortor enim, fringilla a lacus at, maximus semper mauris. Sed malesuada\
		 imperdiet metus vel pellentesque. Sed ullamcorper et purus eget \
		 pharetra. Quisque gravida dictum urna, sed facilisis tortor \
		 pellentesque non. Nunc fringilla, est eget rutrum feugiat, mauris\
		  massa maximus massa, sed tristique nulla arcu at magna. Curabitur\
		   vitae nisi in leo semper condimentum. Fusce id. ", tmp);
	strdup_compare("", tmp);
	printf("-done\n");
	return (0);
}
