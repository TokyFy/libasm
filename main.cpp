/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   init.cpp                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: franaivo <franaivo@student.42antananarivo  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/08/17 21:56:08 by franaivo          #+#    #+#             */
/*   Updated: 2026/10/26 09:09:34 by franaivo         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <cerrno>
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <string>
#include <unistd.h>

#define GREEN "\033[32m"
#define RED "\033[31m"
#define RESET "\033[0m"

static void check(const char *name, bool ok) {
  std::cout << (ok ? GREEN "[PASS] " : RED "[FAIL] ") << RESET << name
            << std::endl;
}

static int sign(int n) { return (n > 0) - (n < 0); }

static void test_strlen() {
  std::cout << "\n== ft_strlen ==" << std::endl;
  check("empty string", ft_strlen("") == 0);
  check("hello", ft_strlen("hello") == 5);
  check("with spaces", ft_strlen("hello world") == strlen("hello world"));
  check("long string", ft_strlen(std::string(1000, 'a').c_str()) == 1000);
}

static void test_strcpy() {
  char dst[32];

  std::cout << "\n== ft_strcpy ==" << std::endl;
  check("returns dst", ft_strcpy(dst, "hello") == dst);
  check("content copied", strcmp(dst, "hello") == 0);
  ft_strcpy(dst, "");
  check("empty string", dst[0] == '\0');
  ft_strcpy(dst, "a longer string");
  check("overwrite", strcmp(dst, "a longer string") == 0);
}

static void test_strcmp() {
  std::cout << "\n== ft_strcmp ==" << std::endl;
  check("equal", ft_strcmp("abc", "abc") == 0);
  check("empty vs empty", ft_strcmp("", "") == 0);
  check("less", sign(ft_strcmp("abc", "abd")) == sign(strcmp("abc", "abd")));
  check("greater", sign(ft_strcmp("abd", "abc")) == sign(strcmp("abd", "abc")));
  check("prefix",
        sign(ft_strcmp("abc", "abcd")) == sign(strcmp("abc", "abcd")));
  check("empty vs str", sign(ft_strcmp("", "a")) == sign(strcmp("", "a")));
  check("unsigned char",
        sign(ft_strcmp("\xff", "a")) == sign(strcmp("\xff", "a")));
}

static void test_write() {
  ssize_t ret;

  std::cout << "\n== ft_write ==" << std::endl;
  const char msg[] = "  (written by ft_write)\n";
  ret = ft_write(1, msg, sizeof(msg) - 1);
  check("returns count", ret == (ssize_t)(sizeof(msg) - 1));
  errno = 0;
  ret = ft_write(-1, "x", 1);
  check("bad fd returns -1", ret == -1);
  check("bad fd sets EBADF", errno == EBADF);
}

static void test_read() {
  int fd[2];
  char buf[16] = {0};
  ssize_t ret;

  std::cout << "\n== ft_read ==" << std::endl;
  if (pipe(fd) == -1) {
    check("pipe creation", false);
    return;
  }
  write(fd[1], "hello", 5);
  ret = ft_read(fd[0], buf, 5);
  check("returns count", ret == 5);
  check("content read", strcmp(buf, "hello") == 0);
  close(fd[0]);
  close(fd[1]);
  errno = 0;
  ret = ft_read(-1, buf, 1);
  check("bad fd returns -1", ret == -1);
  check("bad fd sets EBADF", errno == EBADF);
}

static void test_strdup() {
  const char *src = "hello";
  char *dup = ft_strdup(src);

  std::cout << "\n== ft_strdup ==" << std::endl;
  check("not NULL", dup != NULL);
  check("different pointer", dup != src);
  check("same content", dup && strcmp(dup, src) == 0);
  free(dup);
  dup = ft_strdup("");
  check("empty string", dup && dup[0] == '\0');
  free(dup);
}

int main() {
  test_strlen();
  test_strcpy();
  test_strcmp();
  test_write();
  test_read();
  test_strdup();
}
