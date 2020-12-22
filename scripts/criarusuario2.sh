#!/bin/bash
tput setaf 7 ; tput bold ; echo "Criar Usuário SSH" ; tput sgr0
			echo ""
			read -p "Nome:" username
			awk -F : ' { print $1 }' /etc/passwd > /tmp/users
			if grep -Fxq "$username" /tmp/users
			then
				echo ""
				tput setaf 3 ; tput bold ; echo "Este usuário já existe!" ; tput sgr0
				echo ""
				sleep 5
				menu
				#exit 1
			else
				if (echo $username | egrep [^a-zA-Z0-9.-_] &> /dev/null)
				then
					echo ""
					tput setaf 3 ; tput bold ; echo "Você digitou um nome de usuário inválido!"
					echo "Use apenas letras, números, pontos e traços." 
					echo "Não use espaços, acentos ou caracteres especiais!" ; tput sgr0
					echo ""
					sleep 5
					menu
					#exit 1
				else
					sizemin=$(echo ${#username})
					if [[ $sizemin -lt 2 ]]
					then
						echo ""
						tput setaf 3 ; tput bold ; echo "Você digitou um nome de usuário muito curto," 
						echo "use no mínimo dois caracteres!" ; tput sgr0
						echo ""
						sleep 5
						menu
						#exit 1
					else
						sizemax=$(echo ${#username})
						if [[ $sizemax -gt 32 ]]
						then
							echo ""
							tput setaf 3 ; tput bold ; echo "Você digitou um nome de usuário muito grande," 
							echo "use no máximo 32 caracteres!" ; tput sgr0
							echo ""
							sleep 5
							menu
							#exit 1
						else
							if [[ -z $username ]]
							then
								echo ""
								tput setaf 3 ; tput bold ; echo "Você digitou um nome de usuário vazio!" ; tput sgr0 
								echo ""
								sleep 5
								menu
								#exit 1
							else
								read -p "Senha: " password
								if [[ -z $password ]]
								then
									echo ""
									tput setaf 3 ; tput bold ; echo "Você digitou uma senha vazia!" ; tput sgr0 
									echo ""
									sleep 5
									menu
									#exit 1
								else
									sizepass=$(echo ${#password})
									if [[ $sizepass -lt 6 ]]
									then
										echo ""
										tput setaf 3 ; tput bold ; echo "Você digitou uma senha muito curta!" 
										echo "Para manter o usuário seguro use no mínimo 6 caracteres"
										echo "combinando diferentes letras e números!" ; tput sgr0
										echo ""
										sleep 5
										menu
										#exit 1
									else
										read -p "Dias para expirar: " dias
										if (echo $dias | egrep '[^0-9]' &> /dev/null)
										then
											echo ""
											tput setaf 3  tput bold ; echo "Você digitou um número de dias inválido!" ; tput sgr0
											echo ""
											sleep 5
											menu
											#exit 1
										else
											if [[ -z $dias ]]
											then
												echo ""
												tput setaf 3 ; tput bold ; echo "Você deixou o número de dias para a conta expirar vazio!" ; tput sgr0
												echo ""
												sleep 5
												menu
												#exit 1
											else
												if [[ $dias -lt 1 ]]
												then
													echo ""
													tput setaf 3 ; tput bold ; echo "Você deve digitar um número de dias maior que zero!" ; tput sgr0
													echo ""
													sleep 5
													menu
													#exit 1
												else
													read -p "Nº de conexões simultâneas permitidas: " sshlimiter
													if (echo $sshlimiter | egrep '[^0-9]' &> /dev/null)
													then
														echo ""
														tput setaf 3 ; tput bold ; echo "Você digitou um número de conexões inválido!" ; tput sgr0
														echo ""
														sleep 5
														menu
														#exit 1
													else
														if [[ -z $sshlimiter ]]
														then
															echo ""
															tput setaf 3 ; tput bold ; echo "Você deixou o número de conexões simultâneas vazio!" ; tput sgr0
															echo ""
															sleep 5
															menu
															#exit 1
														else
															if [[ $sshlimiter -lt 1 ]]
															then
																echo ""
																tput setaf 3 ; tput bold ; echo "Você deve digitar um número de conexões simultâneas maior que zero!" ; tput sgr0
																echo ""
																sleep 5
																menu
																#exit 1
															else
																final=$(date "+%Y-%m-%d" -d "+$dias days")
																gui=$(date "+%d/%m/%Y" -d "+$dias days")
																pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
																useradd -e $final -M -s /bin/false -p $pass $username
																[ $? -eq 0 ] && tput setaf 2 ; tput bold ; echo ""; echo "Usuário $username criado" ; echo "Data de expiração: $gui" ; echo "Nº de conexões simultâneas permitidas: $sshlimiter" ; echo "" || echo "Não foi possível criar o usuário!" ; tput sgr0
																echo "$username $sshlimiter" >> /root/usuarios.db
																sleep 5
																menu
															fi
														fi
													fi
												fi
											fi
										fi
									fi
								fi
							fi
						fi
					fi
				fi
			fi
